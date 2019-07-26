#[cfg(target_os = "android")]
extern crate android_logger;
#[macro_use]
extern crate log;
extern crate log_panics;

#[cfg(target_os = "android")]
mod android_c_headers;
#[cfg(target_os = "android")]
mod java_glue;
#[cfg(target_os = "android")]
pub use crate::java_glue::*;

use wallet::{
    util::{
        crypto::{SeedOrVect},
        bip32::{self, Node, CurveName, SK_BYTES, PK_BYTES},
    },
    coin::{Coin, Outputs},
    hex,
};

#[derive(Default)]
struct C{
    private_key: String,
    public_key: String,    
    wif: String,
    address: String,
    ticker: String,
    /*
    If Make changes to this structure then modify
    1) java_glue.rs.in
    2) MainActivity.kt -> Wallet Class, and callling reference
    3) models/coin.dart class
    */
}
impl C{
    pub fn new()-> C{ C{..Default::default()} }
    pub fn private_key(&self) -> &str{ &self.private_key }
    pub fn public_key(&self) -> &str{ &self.public_key }
    pub fn wif(&self) -> &str{ &self.wif }
    pub fn address(&self) -> &str{ &self.address }
    pub fn ticker(&self) -> &str{ &self.ticker }
    pub fn get_wallets(mnemonic: String) -> Vec<C>{
        
        let seed = bip32::generate_seed(Some(&mnemonic), None);
        let node = Node::new(&SeedOrVect::Seed(seed), CurveName::Secp256k1, b"Bitcoin seed");

        let tickers: Vec<&str> = vec!["btc","eth"];
        tickers.iter().enumerate().map(|(_i, &ticker)|{
            let coin = Coin::new(&ticker, None, None,Some(node.clone()));

            C{private_key: hex::encode(&coin.private_key), public_key: hex::encode(&coin.public_key.to_vec()), wif: coin.to_wif(), address: coin.to_address(), ticker: ticker.to_uppercase().to_string() }
        }).collect::<Vec<_>>()
    }
    pub fn gen_send_transaction(ticker: &str, private_key: String, public_key: String, outputs: Vec<Outputs>) -> String{
        let private_key = hex::decode(private_key).unwrap();
        let public_key = &hex::decode(public_key).unwrap();

        let mut array = [0; SK_BYTES];
        let bytes = &private_key[..array.len()];
        array.copy_from_slice(bytes); 

        let mut array2 = [0; PK_BYTES];
        let bytes = &public_key[..array2.len()];
        array2.copy_from_slice(bytes); 


        let c = Coin::new(ticker, Some(array), Some(array2), None);
        c.gen_send_transaction(outputs)    
    }
}
