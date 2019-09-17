use wallet::{
    util::{
        crypto::{SeedOrVect},
        bip32::{self, Node, SK_BYTES, PK_BYTES, PubKey},
        base58::{Base58Network},
        CurveName,
    },
    coin::{
        self,
        Opts,
        CurveNodes,
        Coin,
        Outputs,
        CoinType,
    },
    shuttle_core,
};
use super::protos;

pub fn get_wallets(configs: protos::coin::Configs, mnemonic: String) -> protos::coin::CoinsList{
    let seed = bip32::generate_seed(Some(&mnemonic), None);
    let node1 = Node::new(&SeedOrVect::Seed(seed.clone()), CurveName::Secp256k1, b"Bitcoin seed");
    let node2 = Node::new(&SeedOrVect::Seed(seed.clone()), CurveName::Secp256r1, b"Nist256p1 seed");
    let node3 = Node::new(&SeedOrVect::Seed(seed.clone()), CurveName::Ed25519, b"ed25519 seed");
    let nodes = CurveNodes{
        secp256k1: Some(node1),
        secp256r1: Some(node2),
        ed25519: Some(node3),
    };
   
    let mut coinlist = protos::coin::CoinsList::new();

    for config in &configs.list {
        let (ctype, opts, _) = from_config(&config);
        
        let coin = Coin::new(ctype, opts, None, None,Some(nodes.clone()));
        let output_coin = protos::coin::Coin{
            private_key: coin.private_key.to_vec(),
            public_key: coin.public_key.concat(&[]),
            wif: coin.to_wif(),
            address: coin.to_address(),
            rel: config.rel.clone(),
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


pub fn gen_send_transaction(config: &protos::coin::Config, api: &str, private_key: Vec<u8>, public_key: Vec<u8>, os: protos::coin::Outputs) -> String{
    
    let (ctype, opts, _) = from_config(&config);

    let mut array = [0; SK_BYTES];
    let bytes = &private_key[..array.len()];
    array.copy_from_slice(bytes); 

    let pubkey = match opts.curve_name {
        CurveName::Ed25519 => {
            let mut array2 = [0; SK_BYTES];
            let bytes = &public_key[..array2.len()];
            array2.copy_from_slice(bytes);
            PubKey::Ed25519(array2)
        },
        _ => {
            let mut array2 = [0; PK_BYTES];
            let bytes = &public_key[..array2.len()];
            array2.copy_from_slice(bytes); 
            PubKey::Secp256k1(array2)
        }
    };
    let outputs = os.list.iter().enumerate().map(|(_i, o)|{
        Outputs{
            address: o.address.clone(),
            value: o.value,
            memo: o.memo.clone(),
        }
    }).collect::<Vec<_>>();
    let c = Coin::new(ctype, opts, Some(array), Some(pubkey), None);

    c.gen_send_transaction(outputs, api).unwrap()
}



macro_rules! btcm {
    ($btc:ident, $rel:expr, $code:expr, $precision:expr, $private:expr, $public:expr, $prefix:expr) => {
        (
            CoinType::$btc(coin::$btc::$btc{
                network: Base58Network{
                    private: vec![$private],
                    public: vec![$public],
                },
                prefix: $prefix.to_string(),
            }),
            Opts{
                slips44_code: $code,
                precision: $precision,
                rel: $rel.to_string(),
                ..Default::default()
            },
            stringify!($btc).to_string()
        )
    }
}

macro_rules! ethm {
    ($eth:ident, $rel:expr, $code:expr, $precision:expr, $chain_id:expr) => {
        (
            CoinType::$eth(coin::$eth::$eth{
                chain_id : $chain_id,
            }),
            Opts{
                slips44_code: $code,
                precision: $precision,
                rel: $rel.to_string(),
                ..Default::default()
            },
            stringify!($eth).to_string()
        )
    }
}
macro_rules! xlmm {
    ($xlm:ident, $rel:expr, $code:expr, $precision:expr, $network_passphrase:expr) => {
        (
            CoinType::$xlm(coin::$xlm::$xlm{
                network : shuttle_core::Network::new($network_passphrase),
            }),
            Opts{
                slips44_code: $code,
                precision: $precision,
                rel: $rel.to_string(),
                curve_name: CurveName::Ed25519
            },
            stringify!($xlm).to_string()
        )
    }
}
macro_rules! xrpm {
    ($xrp:ident, $rel:expr, $code:expr, $precision:expr) => {
        (
            CoinType::$xrp(coin::$xrp::$xrp{}),
            Opts{
                slips44_code: $code,
                precision: $precision,
                rel: $rel.to_string(),
                ..Default::default()
                
            },
            stringify!($xrp).to_string()
        )
    }
}
macro_rules! neom {
    ($neo:ident, $rel:expr, $code:expr, $precision:expr, $private:expr, $public:expr) => {
        (
            CoinType::$neo(coin::$neo::$neo{
                network: Base58Network{
                    private: vec![$private],
                    public: vec![$public],
                },
            }),
            Opts{
                slips44_code: $code,
                precision: $precision,
                rel: $rel.to_string(),
                curve_name: CurveName::Secp256r1,
            },
            stringify!($neo).to_string()
        )
    }
}
pub fn from_config(config: &protos::coin::Config) -> (CoinType, Opts, String){
    let precision = config.precision as i32;
    let public = config.public as u8;
    let private = config.public as u8;
    let chain_id = config.chain_id as u8;

    let p: &str = &config.protocol;
    match p {
        "btc" => btcm!(btc, config.rel, config.code, precision, private, public, config.prefix),
        "eos" => btcm!(eos, config.rel, config.code, precision, private, public, config.prefix),
        "eth" => ethm!(eth, config.rel, config.code, precision, chain_id),
        "xlm" => xlmm!(xlm, config.rel, config.code, precision, config.prefix.clone()),
        "xrp" => xrpm!(xrp, config.rel, config.code, precision),
        "neo" => neom!(neo, config.rel, config.code, precision, private, public),
        _ => panic!("not expected")
    }
}
/*
#[cfg(test)]
mod tests {
    use super::*;
    const API: &str = "http://localhost:4000/api";

    macro_rules! ticker {
        ( $base:expr, $rels:expr ) => {
            protos::coin::Ticker{
                rel:  protobuf::RepeatedField::from_vec($rels),
                base:  $base.to_string(),
                ..Default::default()
            }
        }
    }
    fn t() -> protos::coin::Tickers{
        protos::coin::Tickers{
            list: protobuf::RepeatedField::from_vec(
                vec![
                    ticker!("btc", vec!["btc".to_string()]),
                    ticker!("eth", vec!["eth".to_string()]),
                    ticker!("xlm", vec!["xlm".to_string()]),
                    ticker!("xrp", vec!["xrp".to_string()]),
                    ticker!("eos", vec!["eos".to_string()]),
                    ticker!("neo", vec!["neo".to_string(), "ont".to_string()]),
                ]
            ),
            ..Default::default()
        }
    }

    #[test]
    fn gentx_test(){
        let t = t();
        let y = get_wallets(t, "connect ritual news sand rapid scale behind swamp damp brief explain ankle".to_string(), true);
        let x = y.list.into_vec();

        let tx = gen_send_transaction("btc", true, API, x[0].coin[0].private_key.clone(), x[0].coin[0].public_key.clone(), protos::coin::Outputs{
            list: protobuf::RepeatedField::from_vec(
                vec![
                protos::coin::Output{
                    address: x[0].coin[0].address.clone(),
                    value: 1.0,
                    ..Default::default()
                }
            ]), 
            ..Default::default()
        });

        assert_eq!(tx, "02000000000101b668b55ae3de4bbb98937c84aeed4df65c4901ef84b4d716cfdc1ffc78da518e000000006a483045022100df4b333d977743c75998249e5a53115d07f516ed21e7acbb2c8eb3207c9d0891022039956275136d0cbc9157eaed136adeb9b7f20e3a4e21fb89ffacdb9af30593020120e06871b7c067ebc1815d056391dc2aae55092b81fb9913b0077bcca64e23ba62ffffffff0100e1f50500000000160014804524dd80e1a2d0ead297fa3699c9b89c08dff20240df4b333d977743c75998249e5a53115d07f516ed21e7acbb2c8eb3207c9d089139956275136d0cbc9157eaed136adeb9b7f20e3a4e21fb89ffacdb9af30593022102051021b3cc91f6ea0342dca37ed84306402d0a88b08816223f40155f3532563700000000");

        let tx = gen_send_transaction("eth", true, API, x[1].coin[0].private_key.clone(), x[1].coin[0].public_key.clone(), protos::coin::Outputs{
            list: protobuf::RepeatedField::from_vec(
                vec![
                protos::coin::Output{
                    address: x[1].coin[0].address.clone(),
                    value: 1.0,
                    ..Default::default()
                }
            ]), 
            ..Default::default()
        });
        assert_eq!(tx, "f86c078504a817c8008252089463314f12ef9df6b0aaced9c770d8869da818e8ea880de0b6b3a7640000802ca023f4fa05ced39c028522fd51f05f9d5360c646fb0cbebc24bf8f4f12067dc8fea0479f400a4be359fe8972a3041f642951fc71934e01ef64af5a4f198c865f18b1");
     
    }
    #[test]
    fn connector_test() {
        let t = t();

        let y = get_wallets(t, "connect ritual news sand rapid scale behind swamp damp brief explain ankle".to_string(), false);
        let x = y.list.into_vec();
        assert_eq!(x[0].coin[0].address, "bc1qhee7awenpfzmn7tuk95vrkuhctj8h5mh7yrxnu");
        assert_eq!(x[1].coin[0].address, "0xb023b80afad0363ab966cf10b5f76e5f625cf497");
        assert_eq!(x[2].coin[0].address, "GDEHOJPTD6I336QBOTSIADKTKAVWKVWEF5S2QFNPBWQN7TCTL5TFSPCR");
        assert_eq!(x[2].coin[0].wif, "SAOR373KUDDGZ7QN4HNXFQKIFMZKFMRMWP6B7XAHMVEIQBVR5IDYVHXH");
        assert_eq!(x[3].coin[0].address, "rPphbLGemSQv4De1LUHYq6tupBkrrZUxNe");
        assert_eq!(x[4].coin[0].address, "EOS5ZXHpkLdY9qqYLEL5D5VPwZop9BrF6pCMT4QauJJzkrA7xitfA");
        assert_eq!(x[4].coin[0].wif, "5K7V5He9abzwEavLTEVeWj4U9xEtVdnrGD4jc5piNvmbAz45mcS");
        assert_eq!(x[5].coin[0].address, "AShDKgLSuCjGZr8Fs5SRLSYvmcSV7S4zwX");
        assert_eq!(x[5].coin[1].address, "AZMnsLjJ5ykADJEXcy7CMA5UnGzKEL8WKQ");
    }    
}

*/