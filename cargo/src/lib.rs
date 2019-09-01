mod protos;
mod connector;
use jni::objects::JString;
use protobuf::Message;

use jni::objects::JClass;
use jni::JNIEnv;
use jni::sys::{jbyteArray, jboolean};

#[allow(non_snake_case)]
#[no_mangle]
pub extern "system" fn Java_com_example_wallet_1flutter_MainActivity_getWallet(
    // Java environment.
    env: JNIEnv,
    // Static class which owns this method.
    _class: JClass,

    input1: jbyteArray,
    input2: JString,
) -> jbyteArray {
    let mnemonic: String = env.get_string(input2).unwrap().into();
    //byte array -> vector
    let b =  env.convert_byte_array(input1).unwrap();
    //vector -> protobuf -> rust struct
    let tickers = protobuf::parse_from_bytes::<protos::coin::TickerList>(&b).unwrap().strings.into_vec();
    // func -> rust struct -> protobuf -> vector
    let v: Vec<u8> = connector::get_wallets(tickers, mnemonic, false).write_to_bytes().unwrap();
    // vector -> java array
    let output = env.byte_array_from_slice(&v).unwrap();

    output
}