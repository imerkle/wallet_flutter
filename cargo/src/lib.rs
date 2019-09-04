mod protos;
mod connector;
use jni::objects::JString;
use protobuf::Message;

use jni::objects::JClass;
use jni::JNIEnv;
use jni::sys::{jbyteArray};

#[allow(non_snake_case)]
#[no_mangle]
pub extern "system" fn Java_com_example_wallet_1flutter_MainActivity_getWallet(
    // Java environment.
    env: JNIEnv,
    // Static class which owns this method.
    _class: JClass,

    input1: jbyteArray,
    input2: JString,
    is_testnet: bool,
) -> jbyteArray {
    let mnemonic: String = env.get_string(input2).unwrap().into();
    //byte array -> vector
    let b =  env.convert_byte_array(input1).unwrap();
    //vector -> protobuf -> rust struct
    let tickers = protobuf::parse_from_bytes::<protos::coin::Tickers>(&b).unwrap();
    // func -> rust struct -> protobuf -> vector
    let v: Vec<u8> = connector::get_wallets(tickers, mnemonic, is_testnet).write_to_bytes().unwrap();
    // vector -> java array
    let output = env.byte_array_from_slice(&v).unwrap();

    output
}

#[allow(non_snake_case)]
#[no_mangle]
pub extern "system" fn Java_com_example_wallet_1flutter_MainActivity_genSendTransaction(
    // Java environment.
    env: JNIEnv,
    // Static class which owns this method.
    _class: JClass,

    input1: JString,
    is_testnet: bool,
    input3: jbyteArray,
    input4: jbyteArray,
    input5: jbyteArray,
) -> jbyteArray {
    let rel: String = env.get_string(input1).unwrap().into();
    let private_key =  env.convert_byte_array(input3).unwrap();
    let public_key =  env.convert_byte_array(input4).unwrap();
    
    let b =  env.convert_byte_array(input5).unwrap();
    let outputs = protobuf::parse_from_bytes::<protos::coin::Outputs>(&b).unwrap();

    let tx_hex = connector::gen_send_transaction(&rel, is_testnet, private_key, public_key, outputs);

    let v: Vec<u8> = protos::coin::Tx{
        tx_hex,
        ..Default::default()
    }.write_to_bytes().unwrap();

    let output = env.byte_array_from_slice(&v).unwrap();

    output
}