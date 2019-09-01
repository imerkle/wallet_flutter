use wallet::{
    util::{
        crypto::{SeedOrVect},
        bip32::{self, Node, SK_BYTES, PK_BYTES, PubKey},
        base58::{Base58Network},
        CurveName,
    },
    hex,
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

pub fn get_wallets(tickers: Vec<String>, mnemonic: String, is_testnet: bool) -> protos::coin::CoinList{
    let seed = bip32::generate_seed(Some(&mnemonic), None);
    let node1 = Node::new(&SeedOrVect::Seed(seed.clone()), CurveName::Secp256k1, b"Bitcoin seed");
    let node2 = Node::new(&SeedOrVect::Seed(seed.clone()), CurveName::Secp256r1, b"Nist256p1 seed");
    let node3 = Node::new(&SeedOrVect::Seed(seed.clone()), CurveName::Ed25519, b"ed25519 seed");
    let nodes = CurveNodes{
        secp256k1: Some(node1),
        secp256r1: Some(node2),
        ed25519: Some(node3),
    };

    let v = tickers.iter().enumerate().map(|(_i, ticker)|{
        let (ctype, opts) = from_ticker(&ticker, is_testnet);
        let coin = Coin::new(ctype, opts, None, None,Some(nodes.clone()));

        protos::coin::Coin{
            private_key: coin.private_key.to_vec(),
            public_key: coin.public_key.concat(&[]),
            wif: coin.to_wif(),
            address: coin.to_address(),
            rel: ticker.to_string(),
            ..Default::default()
        }
    }).collect::<Vec<_>>();
    protos::coin::CoinList{
        coin: protobuf::RepeatedField::from_vec(v),
        ..Default::default()
    }
}


pub fn gen_send_transaction(rel: &str, private_key: Vec<u8>, public_key: Vec<u8>, outputs: Vec<Outputs>) -> String{
    
    let (ctype, opts) = from_ticker(&rel, false);

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

    let c = Coin::new(ctype, opts, Some(array), Some(pubkey), None);
    c.gen_send_transaction(outputs)
}


macro_rules! address_matches {
    ( 
        $e:expr,
        $([$btc:ident, $rel:expr, $base:expr, $code:expr, $private:expr, $public:expr, $prefix:expr]),* ;

        $([$eth:ident, $rel1:expr, $base1:expr, $code1:expr, $chain_id:expr]),* ;
        
        $([$xlm:ident, $rel2:expr, $base2:expr, $code2:expr, $network_passphrase:expr]),* ;

        $([$xrp:ident, $rel3:expr, $base3:expr, $code3:expr]),* ;

        $([$neo:ident, $rel4:expr, $base4:expr, $code4:expr, $private4:expr, $public4:expr]),* 
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
                    base: $base.to_string(),
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
                    base: $base1.to_string(),
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
                    base: $base2.to_string(),
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
                    base: $base3.to_string(),
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
                    base: $base4.to_string(),
                    curve_name: CurveName::Secp256r1,
                }
            ), 
        )*
        _=> panic!("hoho match error")
    }
    }
}

pub fn from_ticker(coin_type: &str, is_testnet: bool) -> (CoinType, Opts){
    address_matches!(coin_type.to_lowercase().as_str(),
        [btc, "btc", "btc", 0, 128, 0, "bc"],
        [eos, "eos", "eos", 194, 128, 0, "EOS"];
        [eth, "eth", "eth", 60, 62] ;
        [xlm, "xlm", "xlm", 148, "Public Global Stellar Network ; September 2015".to_string()] ;
        [xrp, "xrp", "xrp", 144] ;
        [neo, "neo", "neo", 888, 128, 0],
        [neo, "ont", "neo", 1024, 128, 0]
    )
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn connector_test() {
        let v1: Vec<&str> = vec!["btc","eth","xlm", "xrp", "eos","neo","ont"];
        let v2: Vec<String> = v1.iter().map(|s| s.to_string()).collect();
        let x = get_wallets(v2, "connect ritual news sand rapid scale behind swamp damp brief explain ankle".to_string(), false);
        assert_eq!(x.coin[0].address, "bc1qhee7awenpfzmn7tuk95vrkuhctj8h5mh7yrxnu");
        assert_eq!(x.coin[1].address, "b023b80afad0363ab966cf10b5f76e5f625cf497");
        assert_eq!(x.coin[2].address, "GDEHOJPTD6I336QBOTSIADKTKAVWKVWEF5S2QFNPBWQN7TCTL5TFSPCR");
        assert_eq!(x.coin[2].wif, "SAOR373KUDDGZ7QN4HNXFQKIFMZKFMRMWP6B7XAHMVEIQBVR5IDYVHXH");
        assert_eq!(x.coin[3].address, "rPphbLGemSQv4De1LUHYq6tupBkrrZUxNe");
        assert_eq!(x.coin[4].address, "EOS5ZXHpkLdY9qqYLEL5D5VPwZop9BrF6pCMT4QauJJzkrA7xitfA");
        assert_eq!(x.coin[4].wif, "5K7V5He9abzwEavLTEVeWj4U9xEtVdnrGD4jc5piNvmbAz45mcS");
        assert_eq!(x.coin[5].address, "AShDKgLSuCjGZr8Fs5SRLSYvmcSV7S4zwX");
        assert_eq!(x.coin[6].address, "AZMnsLjJ5ykADJEXcy7CMA5UnGzKEL8WKQ");
    }    
}
