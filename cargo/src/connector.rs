use wallet::{
    coin, shuttle_core,
    util::{
        base58::Base58Network,
        bip32::{self, Node},
        crypto::SeedOrVect,
        hex_decode, CurveName,
    },
};

use super::protos;

pub fn get_wallets(configs: &protos::coin::Configs, mnemonic: String) -> protos::coin::Coins {
    let seed = bip32::generate_seed(Some(&mnemonic), None);
    let node1 = Node::new(
        &SeedOrVect::Seed(seed.clone()),
        CurveName::Secp256k1,
        b"Bitcoin seed",
    );
    let node2 = Node::new(
        &SeedOrVect::Seed(seed.clone()),
        CurveName::Secp256r1,
        b"Nist256p1 seed",
    );
    let node3 = Node::new(
        &SeedOrVect::Seed(seed.clone()),
        CurveName::Ed25519,
        b"ed25519 seed",
    );

    let mut coins = protos::coin::Coins::new();

    coins.set_list(protobuf::RepeatedField::from_vec(
        configs
            .list
            .iter()
            .map(|config| {
                let (gcw, opts, _) = from_config(&config, None);
                let n = match opts.curve_name {
                    CurveName::Secp256k1 => node1.clone(),
                    CurveName::Secp256r1 => node2.clone(),
                    CurveName::Ed25519 => node3.clone(),
                };
                let (sk, pk) = coin::generate_keypair(&opts, Some(n));
                let gc = gcw.unwrap();

                //let coin = Coin::new(ctype, opts, None, None,Some(n));
                protos::coin::Coin {
                    rel: config.rel.clone(),
                    base: config.base.clone(),
                    private_key: sk.to_vec(),
                    address: gc.pub_to_address(&pk),
                    wif: gc.priv_to_wif(&sk),
                    public_key: pk,
                    ..Default::default()
                }
            })
            .collect::<Vec<_>>(),
    ));
    coins
}

pub fn gen_send_transaction(
    config: &protos::coin::Config,
    private_key: Vec<u8>,
    public_key: Vec<u8>,
    os: protos::coin::Outputs,
    txi: protos::coin::TxOpts,
) -> String {
    let (gcw, opts, tx_opts) = from_config(&config, Some(&txi));
    let gc = gcw.unwrap();

    //TODO: Input different
    let outputs = os
        .list
        .iter()
        .enumerate()
        .map(|(_i, o)| coin::TxOutputs {
            address: o.address.clone(),
            value: o.value,
            memo: o.memo.clone(),
        })
        .collect::<Vec<_>>();
    gc.gen_send_transaction(outputs, tx_opts.unwrap(), opts, &private_key, &public_key)
}

macro_rules! btc {
    ($btc:ident, $txi:expr, $private:expr, $public:expr, $prefix:expr, $is_compressed:expr, $is_bech32:expr) => {
        (
            Some(Box::new(coin::$btc::$btc {
                network: Base58Network {
                    private: vec![$private],
                    public: vec![$public],
                },
                prefix: $prefix.to_string(),
                is_compressed: $is_compressed,
                is_bech32: $is_bech32,
            })),
            match $txi {
                Some(x) => Some(coin::TxOpts::$btc(coin::$btc::TxOpts {
                    inputs: x
                        .inputs
                        .iter()
                        .map(|o| coin::$btc::transaction::Input {
                            id: hex_decode(&o.id),
                            vout: o.vout,
                            value: o.value,
                        })
                        .collect::<Vec<_>>(),
                })),
                None => None,
            },
        )
    };
}

macro_rules! eos {
    ($eos:ident, $txi:expr, $private:expr, $public:expr, $prefix:expr, $is_compressed:expr) => {
        (
            Some(Box::new(coin::$eos::$eos {
                network: Base58Network {
                    private: vec![$private],
                    public: vec![$public],
                },
                prefix: $prefix.to_string(),
                is_compressed: $is_compressed,
            })),
            None,
        )
    };
}

macro_rules! eth {
    ($eth:ident, $txi:expr, $chain_id:expr) => {
        (
            Some(Box::new(coin::$eth::$eth {
                chain_id: $chain_id,
            })),
            match $txi {
                Some(x) => Some(coin::TxOpts::$eth(coin::$eth::TxOpts {
                    nonce: x.nonce,
                    data: Vec::new(),
                })),
                None => None,
            },
        )
    };
}
macro_rules! xlm {
    ($xlm:ident, $txi:expr, $network_passphrase:expr) => {
        (
            Some(Box::new(coin::$xlm::$xlm {
                network: shuttle_core::Network::new($network_passphrase),
            })),
            match $txi {
                Some(x) => Some(coin::TxOpts::$xlm(coin::$xlm::TxOpts { sequence: x.nonce })),
                None => None,
            },
        )
    };
}
macro_rules! xrp {
    ($xrp:ident, $txi:expr) => {
        (Some(Box::new(coin::$xrp::$xrp {})), None)
    };
}
macro_rules! neo {
    ($neo:ident, $txi:expr, $private:expr, $public:expr) => {
        (
            Some(Box::new(coin::$neo::$neo {
                network: Base58Network {
                    private: vec![$private],
                    public: vec![$public],
                },
            })),
            match $txi {
                Some(x) => Some(coin::TxOpts::$neo(coin::$neo::TxOpts {
                    inputs: x
                        .inputs
                        .iter()
                        .map(|o| coin::$neo::transaction::Input {
                            prev_hash: hex_decode(&o.id),
                            index: o.vout as u8,
                        })
                        .collect::<Vec<_>>(),
                })),
                None => None,
            },
        )
    };
}
pub fn from_config(
    config: &protos::coin::Config,
    tx_opts: Option<&protos::coin::TxOpts>,
) -> (
    Option<Box<dyn coin::GenericCoin + 'static>>,
    coin::CoinOpts,
    Option<coin::TxOpts>,
) {
    let precision = config.precision as i32;
    let private = config.private as u8;
    let public = config.public as u8;
    let chain_id = config.chain_id as u8;

    let p: &str = &config.protocol;
    let (gc, re_txopts): (
        Option<Box<dyn coin::GenericCoin + 'static>>,
        Option<coin::TxOpts>,
    ) = match p {
        "btc" => btc!(
            btc,
            tx_opts,
            private,
            public,
            config.prefix,
            config.is_compressed,
            config.is_bech32
        ),
        "eos" => eos!(
            eos,
            tx_opts,
            private,
            public,
            config.prefix,
            config.is_compressed
        ),
        "eth" => eth!(eth, tx_opts, chain_id),
        "xlm" => xlm!(xlm, tx_opts, config.prefix.clone()),
        "xrp" => xrp!(xrp, tx_opts),
        "neo" => neo!(neo, tx_opts, private, public),
        _ => panic!("not expected"),
    };
    let c: &str = &config.curve_name;
    let curve_name = match c {
        "secp256k1" => CurveName::Secp256k1,
        "secp256r1" => CurveName::Secp256r1,
        "ed25519" => CurveName::Ed25519,
        _ => CurveName::Secp256k1,
    };
    (
        gc,
        coin::CoinOpts {
            slips44_code: config.code,
            precision,
            rel: config.rel.to_string(),
            curve_name,
        },
        re_txopts,
    )
}

#[cfg(test)]
mod tests {
    use super::*;
    use wallet::util::hex_encode;

    macro_rules! config {
        ( $rel:expr, $base:expr, $protocol:expr, $code:expr, $precision:expr, $private:expr, $public:expr, $prefix:expr , $chain_id:expr, $curve_name:expr, $is_compressed:expr, $is_bech32:expr ) => {
            protos::coin::Config {
                rel: $rel.to_string(),
                base: $base.to_string(),
                protocol: $protocol.to_string(),
                code: $code,
                precision: $precision,
                private: $private,
                public: $public,
                prefix: $prefix.to_string(),
                chain_id: $chain_id,
                curve_name: $curve_name.to_string(),
                is_compressed: $is_compressed,
                is_bech32: $is_bech32,
                ..Default::default()
            }
        };
    }

    fn m() -> protos::coin::Configs {
        protos::coin::Configs {
            list: protobuf::RepeatedField::from_vec(vec![
                config!("btc", "btc", "btc", 0, 8, 128, 0, "bc", 0, "", true, true),
                config!("eth", "eth", "eth", 60, 18, 0, 0, "", 1, "", true, false),
                config!(
                    "xlm",
                    "xlm",
                    "xlm",
                    148,
                    6,
                    0,
                    0,
                    "Public Global Stellar Network ; September 2015",
                    0,
                    "ed25519",
                    true,
                    false
                ),
                config!("xrp", "xrp", "xrp", 144, 6, 0, 0, "", 0, "", true, false),
                config!("eos", "eos", "eos", 194, 18, 128, 0, "EOS", 0, "", false, false),
                config!(
                    "neo",
                    "neo",
                    "neo",
                    888,
                    0,
                    0,
                    0,
                    "",
                    0,
                    "secp256r1",
                    true,
                    false
                ),
                config!(
                    "ont",
                    "ont",
                    "neo",
                    1024,
                    0,
                    0,
                    0,
                    "",
                    0,
                    "secp256r1",
                    true,
                    false
                ),
            ]),
            ..Default::default()
        }
    }
    fn t() -> protos::coin::Configs {
        protos::coin::Configs {
            list: protobuf::RepeatedField::from_vec(vec![
                config!("btc", "btc", "btc", 1, 8, 239, 111, "tb", 0, "", true, true),
                config!("eth", "eth", "eth", 60, 18, 0, 0, "", 1, "", true, false),
                config!(
                    "xlm",
                    "xlm",
                    "xlm",
                    148,
                    6,
                    0,
                    0,
                    "Public Global Stellar Network ; September 2015",
                    0,
                    "",
                    true,
                    false
                ),
                config!("xrp", "xrp", "xrp", 144, 6, 0, 0, "", 0, "", true, false),
                config!("eos", "eos", "eos", 194, 18, 128, 0, "EOS", 0, "", false, false),
                config!(
                    "neo",
                    "neo",
                    "neo",
                    888,
                    0,
                    0,
                    0,
                    "",
                    0,
                    "secp256r1",
                    true,
                    false
                ),
                config!(
                    "ont",
                    "ont",
                    "neo",
                    1024,
                    0,
                    0,
                    0,
                    "",
                    0,
                    "secp256r1",
                    true,
                    false
                ),
            ]),
            ..Default::default()
        }
    }

    #[test]
    fn gen_tx_test() {
        let t = t();
        let x = get_wallets(
            &t,
            "connect ritual news sand rapid scale behind swamp damp brief explain ankle"
                .to_string(),
        );
        let tx = gen_send_transaction(
            &t.list[0],
            get_by(&x, "btc", "btc").private_key.clone(),
            get_by(&x, "btc", "btc").public_key.clone(),
            protos::coin::Outputs {
                list: protobuf::RepeatedField::from_vec(vec![protos::coin::Output {
                    address: "2NFUzGLdgrU2qgMBQG9ADts5qR8uPTzZa2H".to_string(),
                    value: 0.0000005,
                    ..Default::default()
                }]),
                ..Default::default()
            },
            protos::coin::TxOpts {
                inputs: protobuf::RepeatedField::from_vec(vec![protos::coin::Input {
                    id: "8e51da78fc1fdccf16d7b484ef01495cf64dedae847c9398bb4bdee35ab568b6"
                        .to_string(),
                    value: 3860409,
                    ..Default::default()
                }]),
                ..Default::default()
            },
        );

        assert_eq!(tx, "02000000000101b668b55ae3de4bbb98937c84aeed4df65c4901ef84b4d716cfdc1ffc78da518e0000000000ffffffff02320000000000000017a914f3ed229a98c4de34c8b1296a1b08820cd67f44a68793e53a0000000000160014f11821b15206392a94df68ccc4ace636f1f323ce0247304402204d38c396626fa4c70a8324dab5cb32c6811d5cce8a3e906bd1dd852e94fd8fcf02203152c04ed4336db9bb1d48655bb87c5efdb788fba1c7471d39c1f976b8febb13012102051021b3cc91f6ea0342dca37ed84306402d0a88b08816223f40155f3532563700000000");

        let tx = gen_send_transaction(
            &t.list[1],
            get_by(&x, "eth", "eth").private_key.clone(),
            get_by(&x, "eth", "eth").public_key.clone(),
            protos::coin::Outputs {
                list: protobuf::RepeatedField::from_vec(vec![protos::coin::Output {
                    address: get_by(&x, "eth", "eth").address.clone(),
                    value: 1.0,
                    ..Default::default()
                }]),
                ..Default::default()
            },
            protos::coin::TxOpts {
                ..Default::default()
            },
        );
        assert_eq!(tx, "f86c808504a817c80082520894b023b80afad0363ab966cf10b5f76e5f625cf497880de0b6b3a76400008026a03c3e905685019344e75dfbf39235f99d5c89df6b231d5ed46a0451fe2f12e404a015b68ef4dce1d1149bd8183f99fda28367b6d96dd17386080efc0feaa54f0c4c");
    }

    #[test]
    fn connector_test() {
        let t = m();

        let x = get_wallets(
            &t,
            "connect ritual news sand rapid scale behind swamp damp brief explain ankle"
                .to_string(),
        );
        assert_eq!(
            get_by(&x, "btc", "btc").wif,
            "KwxFiVzM64x3SEgyYnzCDf8xh3s3Ber66GeD23HkdGrsdKvhGAnf"
        );
        assert_eq!(
            hex_encode(&get_by(&x, "btc", "btc").public_key),
            "03bc140f5f9970ea9b2888f808b117e25949fcf4825ca14929ba12b7a310c6b351"
        );
        assert_eq!(
            get_by(&x, "btc", "btc").address,
            "bc1qhee7awenpfzmn7tuk95vrkuhctj8h5mh7yrxnu"
        );
        assert_eq!(
            get_by(&x, "eth", "eth").address,
            "0xb023b80afad0363ab966cf10b5f76e5f625cf497"
        );
        assert_eq!(
            get_by(&x, "xlm", "xlm").address,
            "GDEHOJPTD6I336QBOTSIADKTKAVWKVWEF5S2QFNPBWQN7TCTL5TFSPCR"
        );
        assert_eq!(
            get_by(&x, "xlm", "xlm").wif,
            "SAOR373KUDDGZ7QN4HNXFQKIFMZKFMRMWP6B7XAHMVEIQBVR5IDYVHXH"
        );
        assert_eq!(
            get_by(&x, "xrp", "xrp").address,
            "rPphbLGemSQv4De1LUHYq6tupBkrrZUxNe"
        );
        assert_eq!(
            get_by(&x, "eos", "eos").address,
            "EOS5ZXHpkLdY9qqYLEL5D5VPwZop9BrF6pCMT4QauJJzkrA7xitfA"
        );
        assert_eq!(
            get_by(&x, "eos", "eos").wif,
            "5K7V5He9abzwEavLTEVeWj4U9xEtVdnrGD4jc5piNvmbAz45mcS"
        );
        assert_eq!(
            get_by(&x, "neo", "neo").address,
            "AShDKgLSuCjGZr8Fs5SRLSYvmcSV7S4zwX"
        );
        assert_eq!(
            get_by(&x, "ont", "ont").address,
            "AZMnsLjJ5ykADJEXcy7CMA5UnGzKEL8WKQ"
        );
    }
    fn get_by(v: &protos::coin::Coins, base: &str, rel: &str) -> protos::coin::Coin {
        v.list
            .iter()
            .find(|x| x.base == base && x.rel == rel)
            .unwrap()
            .clone()
        //v.iter().find(|x| x.base == base).unwrap().list.to_vec()
    }
}
