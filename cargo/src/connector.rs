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

pub fn get_wallets(tickers: protos::coin::Tickers, mnemonic: String, is_testnet: bool) -> protos::coin::CoinsList{
    let seed = bip32::generate_seed(Some(&mnemonic), None);
    let node1 = Node::new(&SeedOrVect::Seed(seed.clone()), CurveName::Secp256k1, b"Bitcoin seed");
    let node2 = Node::new(&SeedOrVect::Seed(seed.clone()), CurveName::Secp256r1, b"Nist256p1 seed");
    let node3 = Node::new(&SeedOrVect::Seed(seed.clone()), CurveName::Ed25519, b"ed25519 seed");
    let nodes = CurveNodes{
        secp256k1: Some(node1),
        secp256r1: Some(node2),
        ed25519: Some(node3),
    };

    let v = tickers.list.into_vec().iter().enumerate().map(|(_i, ticker)|{
        let mut protocol: String = "".to_string();
        let v1 = ticker.rel.clone().into_vec().iter().enumerate().map(|(_i, rel)|{
            let (ctype, opts, p) = from_ticker(&rel, is_testnet);
            protocol = p;
            let coin = Coin::new(ctype, opts, None, None,Some(nodes.clone()));
            protos::coin::Coin{
                private_key: coin.private_key.to_vec(),
                public_key: coin.public_key.concat(&[]),
                wif: coin.to_wif(),
                address: coin.to_address(),
                rel: rel.to_string(),
                ..Default::default()
            }
        }).collect::<Vec<_>>();
        protos::coin::Coins{
            coin: protobuf::RepeatedField::from_vec(v1),
            base: ticker.base.clone(),
            protocol,
            ..Default::default()
        }
    }).collect::<Vec<_>>();
    protos::coin::CoinsList{
        list: protobuf::RepeatedField::from_vec(v),
        ..Default::default()
    }
}


pub fn gen_send_transaction(rel: &str, is_testnet: bool, api: &str, private_key: Vec<u8>, public_key: Vec<u8>, os: protos::coin::Outputs) -> String{
    
    let (ctype, opts, protocol) = from_ticker(&rel, is_testnet);

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

    c.gen_send_transaction(outputs, api)
}


macro_rules! address_matches {
    ( 
        $e:expr,
        $([$btc:ident, $rel:expr, $code:expr, $private:expr, $public:expr, $prefix:expr]),* ;

        $([$eth:ident, $rel1:expr, $code1:expr, $chain_id:expr]),* ;
        
        $([$xlm:ident, $rel2:expr, $code2:expr, $network_passphrase:expr]),* ;

        $([$xrp:ident, $rel3:expr, $code3:expr]),* ;

        $([$neo:ident, $rel4:expr, $code4:expr, $private4:expr, $public4:expr]),* 
    ) => {
    
    match $e {
        $( 
            $rel => (
                CoinType::$btc(coin::$btc::$btc{
                    network: Base58Network{
                        private: vec![$private],
                        public: vec![$public],
                    },
                    prefix: $prefix.to_string(),
                }),
                Opts{
                    slips44_code: $code,
                    precision: 8,
                    rel: $rel.to_string(),
                    ..Default::default()
                },
                stringify!($btc).to_string()
            ), 
        )*    
        $(
            $rel1 => (
                CoinType::$eth(coin::$eth::$eth{
                    chain_id : $chain_id,
                }),
                Opts{
                    slips44_code: $code1,
                    precision: 18,
                    rel: $rel1.to_string(),
                    ..Default::default()
                },
                stringify!($eth).to_string()
            ), 
        )*
        $(
            $rel2 => (
                CoinType::$xlm(coin::$xlm::$xlm{
                    network : shuttle_core::Network::new($network_passphrase),
                }),
                Opts{
                    slips44_code: $code2,
                    precision: 7,
                    rel: $rel2.to_string(),
                    curve_name: CurveName::Ed25519
                },
                stringify!($xlm).to_string()
            ),
        )*
        $(
            $rel3 => (
                CoinType::$xrp(coin::$xrp::$xrp{}),
                Opts{
                    slips44_code: $code3,
                    precision: 6,
                    rel: $rel3.to_string(),
                    ..Default::default()
                    
                },
                stringify!($xrp).to_string()
            ), 
        )*
        $( 
            $rel4 => (
                CoinType::$neo(coin::$neo::$neo{
                    network: Base58Network{
                        private: vec![$private4],
                        public: vec![$public4],
                    },
                }),
                Opts{
                    slips44_code: $code4,
                    precision: 0,
                    rel: $rel4.to_string(),
                    curve_name: CurveName::Secp256r1,
                },
                stringify!($neo).to_string()
            ), 
        )*
        _=> panic!("hoho match error")
    }
    }
}

pub fn from_ticker(coin_type: &str, is_testnet: bool) -> (CoinType, Opts, String){
    if !is_testnet {
        address_matches!(coin_type.to_lowercase().as_str(),
            [btc, "btc", 0, 128, 0, "bc"],
            [eos, "eos", 194, 128, 0, "EOS"];
            [eth, "eth", 60, 62] ;
            [xlm, "xlm", 148, "Public Global Stellar Network ; September 2015".to_string()] ;
            [xrp, "xrp", 144] ;
            [neo, "neo", 888, 128, 0],
            [neo, "ont", 1024, 128, 0]
        )
    }else{
        address_matches!(coin_type.to_lowercase().as_str(),
            [btc, "btc", 1, 239, 111, "tb"],
            [eos, "eos", 1, 128, 0, "EOS"];
            [eth, "eth", 1, 62] ;
            [xlm, "xlm", 1, "Test SDF Network ; September 2015".to_string()] ;
            [xrp, "xrp", 1] ;
            [neo, "neo", 1, 128, 0],
            [neo, "ont", 1, 128, 0]
        )        
    }
}

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
