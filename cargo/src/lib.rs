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
        bip32::{self, Node, CurveName},
    },
};

struct C{
    private_key: String,
    public_key: String,    
}
impl C{
    fn new(mnemonic: String)-> C{
        C{private_key: "".to_string(), public_key: "".to_string()}
    }
    fn private_key(&self) -> &str{
        &self.private_key
    }
    fn public_key(&self) -> &str{
        &self.public_key
    }
    fn get_wallets(mnemonic: String) -> Vec<C>{
        
        let seed = bip32::generate_seed(Some(&mnemonic), None);
        let node = Node::new(&SeedOrVect::Seed(seed), CurveName::Secp256k1, b"Bitcoin seed");

        let codes: Vec<u32> = vec![0];
        
        codes.iter().map(|&x|{
            let path = format!("m/44'/{}'/0'/0/0", x);

            let descendant_node = bip32::derive_descendant_by_path(node.clone(), CurveName::Secp256k1, &path).unwrap(); 

            let pkey = descendant_node.get_private_key();
            let pubkey = descendant_node.get_public_key();
            C{private_key: pkey, public_key: pubkey}
        }).collect::<Vec<_>>()
    }
}
