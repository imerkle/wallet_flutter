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

use wallet::{util, hex};

struct C{}
impl C{
    fn new()-> C{
        C{}
    }
    fn get_seed(mnemonic: String, password: String)-> String{
        let mnemonic: Option<&str> =  if mnemonic.len() == 0 { 
            None
        }else{
            Some(&mnemonic)
        };
        let seed = util::bip32::generate_seed(mnemonic, Some(&password));
        hex::encode(seed.as_bytes())
    }
}
