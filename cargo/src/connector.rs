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

    let v = tickers.ticker.into_vec().iter().enumerate().map(|(_i, ticker)|{
        let v1 = ticker.rel.clone().into_vec().iter().enumerate().map(|(_i, rel)|{
            let (ctype, opts) = from_ticker(&rel, is_testnet);
            let coin = Coin::new(ctype, opts, None, None,Some(nodes.clone()));

            protos::coin::Coin{
                private_key: coin.private_key.to_vec(),
                public_key: coin.public_key.concat(&[]),
                wif: coin.to_wif(),
                address: coin.to_address(),
                rel: rel.to_string(),
                base: ticker.base.clone(),
                ..Default::default()
            }
        }).collect::<Vec<_>>();
        protos::coin::Coins{
            coin: protobuf::RepeatedField::from_vec(v1),
            base: ticker.base.clone(),
            ..Default::default()
        }
    }).collect::<Vec<_>>();
    protos::coin::CoinsList{
        coins: protobuf::RepeatedField::from_vec(v),
        ..Default::default()
    }
}


pub fn gen_send_transaction(rel: &str, is_testnet: bool, private_key: Vec<u8>, public_key: Vec<u8>, os: protos::coin::Outputs) -> String{
    
    let (ctype, opts) = from_ticker(&rel, is_testnet);

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
    let outputs = os.output.iter().enumerate().map(|(_i, o)|{
        Outputs{
            address: o.address.clone(),
            value: o.value,
            memo: o.memo.clone(),
        }
    }).collect::<Vec<_>>();
    let c = Coin::new(ctype, opts, Some(array), Some(pubkey), None);
    c.gen_send_transaction(outputs)
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
                    decimal_point: 8,
                    rel: $rel.to_string(),
                    ..Default::default()
                }
            ), 
        )*    
        $(
            $rel1 => (
                CoinType::$eth(coin::$eth::$eth{
                    chain_id : $chain_id,
                }),
                Opts{
                    slips44_code: $code1,
                    decimal_point: 18,
                    rel: $rel1.to_string(),
                    ..Default::default()
                }
            ), 
        )*
        $(
            $rel2 => (
                CoinType::$xlm(coin::$xlm::$xlm{
                    network : shuttle_core::Network::new($network_passphrase),
                }),
                Opts{
                    slips44_code: $code2,
                    decimal_point: 7,
                    rel: $rel2.to_string(),
                    curve_name: CurveName::Ed25519
                }
            ), 
        )*
        $(
            $rel3 => (
                CoinType::$xrp(coin::$xrp::$xrp{}),
                Opts{
                    slips44_code: $code3,
                    decimal_point: 6,
                    rel: $rel3.to_string(),
                    ..Default::default()
                    
                }
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
                    decimal_point: 0,
                    rel: $rel4.to_string(),
                    curve_name: CurveName::Secp256r1,
                }
            ), 
        )*
        _=> panic!("hoho match error")
    }
    }
}

pub fn from_ticker(coin_type: &str, is_testnet: bool) -> (CoinType, Opts){
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

    macro_rules! ticker {
        ( $base:expr, $rels:expr ) => {
            protos::coin::Ticker{
                rel:  protobuf::RepeatedField::from_vec($rels),
                base:  $base.to_string(),
                ..Default::default()
            }
        }
    }
    #[test]
    fn connector_test() {
        let t = protos::coin::Tickers{
            ticker: protobuf::RepeatedField::from_vec(
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
        };
        let y = get_wallets(t, "connect ritual news sand rapid scale behind swamp damp brief explain ankle".to_string(), false);
        let x = y.coins.into_vec();
        assert_eq!(x[0].coin[0].address, "bc1qhee7awenpfzmn7tuk95vrkuhctj8h5mh7yrxnu");
        assert_eq!(x[1].coin[0].address, "b023b80afad0363ab966cf10b5f76e5f625cf497");
        assert_eq!(x[2].coin[0].address, "GDEHOJPTD6I336QBOTSIADKTKAVWKVWEF5S2QFNPBWQN7TCTL5TFSPCR");
        assert_eq!(x[2].coin[0].wif, "SAOR373KUDDGZ7QN4HNXFQKIFMZKFMRMWP6B7XAHMVEIQBVR5IDYVHXH");
        assert_eq!(x[3].coin[0].address, "rPphbLGemSQv4De1LUHYq6tupBkrrZUxNe");
        assert_eq!(x[4].coin[0].address, "EOS5ZXHpkLdY9qqYLEL5D5VPwZop9BrF6pCMT4QauJJzkrA7xitfA");
        assert_eq!(x[4].coin[0].wif, "5K7V5He9abzwEavLTEVeWj4U9xEtVdnrGD4jc5piNvmbAz45mcS");
        assert_eq!(x[5].coin[0].address, "AShDKgLSuCjGZr8Fs5SRLSYvmcSV7S4zwX");
        assert_eq!(x[5].coin[1].address, "AZMnsLjJ5ykADJEXcy7CMA5UnGzKEL8WKQ");
    }    
}
