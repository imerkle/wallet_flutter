extern crate wasm_bindgen;

use protobuf::Message;
use wallet::{connector, pb};
use wasm_bindgen::prelude::*;

#[wasm_bindgen]
pub fn get_wallet(input: &[u8]) -> Vec<u8> {
    let inputs = protobuf::parse_from_bytes::<pb::wallet::GetWalletsRequest>(input).unwrap();
    let mnemonic = inputs.mnemonic;
    let configs = inputs.configs.unwrap();
    // func -> rust struct -> protobuf -> vector
    let v: Vec<u8> = connector::get_wallets(&configs, mnemonic)
        .write_to_bytes()
        .unwrap();
    v
}
