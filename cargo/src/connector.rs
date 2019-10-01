use wallet::{
    util::{
        crypto::{SeedOrVect},
        bip32::{self, Node},
        base58::{Base58Network},
        CurveName,
    },
    coin::{
        self,
    },
    shuttle_core,
    bitcoin_hashes,
};
use bitcoin_hashes::hex::FromHex;
use super::protos;

pub fn get_wallets(configs: &protos::coin::Configs, mnemonic: String) -> protos::coin::CoinsList{
    let seed = bip32::generate_seed(Some(&mnemonic), None);
    let node1 = Node::new(&SeedOrVect::Seed(seed.clone()), CurveName::Secp256k1, b"Bitcoin seed");
    let node2 = Node::new(&SeedOrVect::Seed(seed.clone()), CurveName::Secp256r1, b"Nist256p1 seed");
    let node3 = Node::new(&SeedOrVect::Seed(seed.clone()), CurveName::Ed25519, b"ed25519 seed");
   
    let mut coinlist = protos::coin::CoinsList::new();

    for config in &configs.list {
        let (gcw, opts) = from_config(&config);
        let n = match opts.curve_name {
            CurveName::Secp256k1 => node1.clone(),
            CurveName::Secp256r1 => node2.clone(),
            CurveName::Ed25519 => node3.clone(),
        };
        let (sk, pk) = coin::generate_keypair(&opts, Some(n));
        let gc = gcw.unwrap();

        //let coin = Coin::new(ctype, opts, None, None,Some(n));
        let output_coin = protos::coin::Coin{
            rel: config.rel.clone(),
            private_key: sk.to_vec(),
            address: gc.pub_to_address(&pk),
            wif: gc.priv_to_wif(&sk),
            public_key: pk,
            ..Default::default()
        };
        
        /*
            Protobuf cant have list without a named param so 

            Coinlist = {list: [Coins]}
            Coins = {base: "", list: [Coin]}
            Coin = {private_key: "", wif:"" ,....}

            This block below takes [Coin] and converts into  Coinlist based on config.base value of current input in loop
        */
        match coinlist.list.iter().position(|x| x.base == config.base){
            Some(i) => {
                coinlist.mut_list()[i].mut_list().push(output_coin);
            },
            None => {
                let mut c = protos::coin::Coins::new();
                c.set_base(config.base.clone());
                c.mut_list().push(output_coin);

                coinlist.mut_list().push(c);
            }
        };
    }
    coinlist
}


pub fn gen_send_transaction(config: &protos::coin::Config, private_key: Vec<u8>, public_key: Vec<u8>, os: protos::coin::Outputs, txi: protos::coin::TxOpts) -> String{
    
    let (gcw, opts) = from_config(&config);
    let gc = gcw.unwrap();

    let outputs = os.list.iter().enumerate().map(|(_i, o)|{
        coin::TxOutputs{
            address: o.address.clone(),
            value: o.value,
            memo: o.memo.clone(),
        }
    }).collect::<Vec<_>>();

    let tx_opts = 
    coin::TxOpts{
        inputs: txi.inputs.iter().enumerate().map(|(i, o)|{
                coin::btc::transaction::Input{
                    index: i as u32,
                    id: bitcoin_hashes::sha256d::Hash::from_hex(&o.id).unwrap(),
                    value: o.value
                }
            }).collect::<Vec<_>>(),
        nonce: txi.nonce,
    };
    
    gc.gen_send_transaction(outputs, tx_opts, opts, &private_key, &public_key)
}


macro_rules! btc {
    ($btc:ident, $private:expr, $public:expr, $prefix:expr, $is_compressed:expr, $is_bech32:expr) => {
        Some(Box::new(coin::$btc::$btc{
            network: Base58Network{
                private: vec![$private],
                public: vec![$public],
            },
            prefix: $prefix.to_string(),
            is_compressed: $is_compressed,
            is_bech32: $is_bech32,
        }))
    }
}

macro_rules! eth {
    ($eth:ident, $chain_id:expr) => {
        Some(Box::new(coin::$eth::$eth{
            chain_id : $chain_id,
        }))
    }
}
macro_rules! xlm {
    ($xlm:ident, $network_passphrase:expr) => {
        Some(Box::new(coin::$xlm::$xlm{
            network : shuttle_core::Network::new($network_passphrase),
        }))
    }
}
macro_rules! xrp {
    ($xrp:ident) => {
        Some(Box::new(coin::$xrp::$xrp{}))
    }
}
macro_rules! neo {
    ($neo:ident, $private:expr, $public:expr) => {
        Some(Box::new(coin::$neo::$neo{
            network: Base58Network{
                private: vec![$private],
                public: vec![$public],
            },
        }))
    }
}
pub fn from_config(config: &protos::coin::Config) -> (Option<Box<coin::GenericCoin + 'static>>, coin::CoinOpts){
    let precision = config.precision as i32;
    let private = config.private as u8;
    let public = config.public as u8;
    let chain_id = config.chain_id as u8;

    let p: &str = &config.protocol;
    let gc: Option<Box<coin::GenericCoin + 'static>> = match p {
        "btc" => btc!(btc, private, public, config.prefix, config.is_compressed, config.is_bech32),
        "eos" => btc!(eos, private, public, config.prefix, config.is_compressed, config.is_bech32),
        "eth" => eth!(eth, chain_id),
        "xlm" => xlm!(xlm, config.prefix.clone()),
        "xrp" => xrp!(xrp),
        "neo" => neo!(neo, private, public),
        _ => panic!("not expected")
    };
    let c: &str = &config.curve_name;
    let curve_name = match c {
        "secp256k1" => CurveName::Secp256k1,
        "secp256r1" => CurveName::Secp256r1,
        "ed25519" => CurveName::Ed25519,
        _ => CurveName::Secp256k1
    };
    (
        gc,
        coin::CoinOpts{
            slips44_code: config.code,
            precision: precision,
            rel: config.rel.to_string(),
            curve_name,
        }
    )
}

#[cfg(test)]
mod tests {
    use wallet::util::hex_encode;
use super::*;

    macro_rules! config {
        ( $rel:expr, $base:expr, $protocol:expr, $code:expr, $precision:expr, $private:expr, $public:expr, $prefix:expr , $chain_id:expr, $curve_name:expr, $is_compressed:expr, $is_bech32:expr ) => {
            protos::coin::Config{
                rel:  $rel.to_string(),
                base:  $base.to_string(),
                protocol:  $protocol.to_string(),
                code:  $code,
                precision:  $precision,
                private:  $private,
                public:  $public,
                prefix:  $prefix.to_string(),
                chain_id:  $chain_id,
                curve_name:  $curve_name.to_string(),
                is_compressed:  $is_compressed,
                is_bech32:  $is_bech32,
                ..Default::default()
            }
        }
    }

    fn m() -> protos::coin::Configs{
        protos::coin::Configs{
            list: protobuf::RepeatedField::from_vec(
                vec![
                    config!("btc", "btc", "btc", 0, 8, 128, 0, "bc", 0, "", true, true),
                    config!("eth", "eth", "eth", 60, 18, 0, 0, "", 1, "", true, false),
                    config!("xlm", "xlm", "xlm", 148, 6, 0, 0, "Public Global Stellar Network ; September 2015", 0, "ed25519", true, false),
                    config!("xrp", "xrp", "xrp", 144, 6, 0, 0, "", 0, "", true, false),
                    config!("eos", "eos", "eos", 194, 18, 128, 0, "EOS", 0, "", false, false),
                    config!("neo", "neo", "neo", 888, 0, 0, 0, "", 0, "secp256r1", true, false),
                    config!("ont", "ont", "neo", 1024, 0, 0, 0, "", 0, "secp256r1", true, false)
                ]
            ),
            ..Default::default()
        }
    }    
    fn t() -> protos::coin::Configs{
        protos::coin::Configs{
            list: protobuf::RepeatedField::from_vec(
                vec![
                    config!("btc", "btc", "btc", 1, 8, 239, 111, "tb", 0, "", true, false),
                    config!("eth", "eth", "eth", 60, 18, 0, 0, "", 1, "", true, false),
                    config!("xlm", "xlm", "xlm", 148, 6, 0, 0, "Public Global Stellar Network ; September 2015", 0, "", true, false),
                    config!("xrp", "xrp", "xrp", 144, 6, 0, 0, "", 0, "", true, false),
                    config!("eos", "eos", "eos", 194, 18, 128, 0, "EOS", 0, "", false, false),
                    config!("neo", "neo", "neo", 888, 0, 0, 0, "", 0, "secp256r1", true, false),
                    config!("ont", "ont", "neo", 1024, 0, 0, 0, "", 0, "secp256r1", true, false)
                ]
            ),
            ..Default::default()
        }
    }

    #[test]
    fn gen_tx_test(){
        let t = t();
        let y = get_wallets(&t, "connect ritual news sand rapid scale behind swamp damp brief explain ankle".to_string());
        let x = y.list.into_vec();
        println!("{:?}", hex_encode(&get_by(&x, "btc")[0].public_key));
        println!("{:?}", hex_encode(&get_by(&x, "btc")[0].private_key));
        let tx = gen_send_transaction(&t.list[0], get_by(&x, "btc")[0].private_key.clone(), get_by(&x, "btc")[0].public_key.clone(), protos::coin::Outputs{
            list: protobuf::RepeatedField::from_vec(
                vec![
                protos::coin::Output{
                    address: get_by(&x, "btc")[0].address.clone(),
                    value: 0.0001,
                    ..Default::default()
                }
            ]), 
            ..Default::default()
        }, protos::coin::TxOpts{
            inputs: protobuf::RepeatedField::from_vec(
                vec![protos::coin::Input{
                    id: "8e51da78fc1fdccf16d7b484ef01495cf64dedae847c9398bb4bdee35ab568b6".to_string(),
                    value: 3860409,
                    ..Default::default()
                }]
            ),
            ..Default::default()           
        });

        assert_eq!(tx, "02000000000101b668b55ae3de4bbb98937c84aeed4df65c4901ef84b4d716cfdc1ffc78da518e0100000000ffffffff011027000000000000160014804524dd80e1a2d0ead297fa3699c9b89c08dff2024076b801407024bbfa1557cc61941cd1fe7a9088bcfbb8a93f7cf92b1336b2422555a35e78360457c84256569c0f94f3d285a6190330839e0ddec0e7be1f91dcf92102051021b3cc91f6ea0342dca37ed84306402d0a88b08816223f40155f3532563700000000");


        let tx = gen_send_transaction(&t.list[1], get_by(&x, "eth")[0].private_key.clone(), get_by(&x, "eth")[0].public_key.clone(), protos::coin::Outputs{
            list: protobuf::RepeatedField::from_vec(
                vec![
                protos::coin::Output{
                    address: get_by(&x, "eth")[0].address.clone(),
                    value: 1.0,
                    ..Default::default()
                }
            ]), 
            ..Default::default()
        }, protos::coin::TxOpts{
            ..Default::default()
        });
        //assert_eq!(tx, "f86c808504a817c80082520894b023b80afad0363ab966cf10b5f76e5f625cf497880de0b6b3a76400008026a03c3e905685019344e75dfbf39235f99d5c89df6b231d5ed46a0451fe2f12e404a015b68ef4dce1d1149bd8183f99fda28367b6d96dd17386080efc0feaa54f0c4c");
     
    }
    
    #[test]
    fn connector_test() {
        let t = m();

        let y = get_wallets(&t, "connect ritual news sand rapid scale behind swamp damp brief explain ankle".to_string());
        let x = y.list.into_vec();
        assert_eq!(get_by(&x, "btc")[0].wif, "KwxFiVzM64x3SEgyYnzCDf8xh3s3Ber66GeD23HkdGrsdKvhGAnf");
        assert_eq!(hex_encode(&get_by(&x, "btc")[0].public_key), "03bc140f5f9970ea9b2888f808b117e25949fcf4825ca14929ba12b7a310c6b351");
        assert_eq!(get_by(&x, "btc")[0].address, "bc1qhee7awenpfzmn7tuk95vrkuhctj8h5mh7yrxnu");
        assert_eq!(get_by(&x, "eth")[0].address, "0xb023b80afad0363ab966cf10b5f76e5f625cf497");
        assert_eq!(get_by(&x, "xlm")[0].address, "GDEHOJPTD6I336QBOTSIADKTKAVWKVWEF5S2QFNPBWQN7TCTL5TFSPCR");
        assert_eq!(get_by(&x, "xlm")[0].wif, "SAOR373KUDDGZ7QN4HNXFQKIFMZKFMRMWP6B7XAHMVEIQBVR5IDYVHXH");
        assert_eq!(get_by(&x, "xrp")[0].address, "rPphbLGemSQv4De1LUHYq6tupBkrrZUxNe");
        assert_eq!(get_by(&x, "eos")[0].address, "EOS5ZXHpkLdY9qqYLEL5D5VPwZop9BrF6pCMT4QauJJzkrA7xitfA");
        assert_eq!(get_by(&x, "eos")[0].wif, "5K7V5He9abzwEavLTEVeWj4U9xEtVdnrGD4jc5piNvmbAz45mcS");
        assert_eq!(get_by(&x, "neo")[0].address, "AShDKgLSuCjGZr8Fs5SRLSYvmcSV7S4zwX");
        assert_eq!(get_by(&x, "ont")[0].address, "AZMnsLjJ5ykADJEXcy7CMA5UnGzKEL8WKQ");
    }    
    fn get_by(v: &Vec<protos::coin::Coins>, base: &str) -> Vec<protos::coin::Coin>{
        v.iter().find(|x| x.base == base ).unwrap().list.to_vec()
    }
}

