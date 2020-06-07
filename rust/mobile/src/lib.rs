use jni::objects::JClass;
use jni::sys::jbyteArray;
use jni::JNIEnv;
use protobuf::Message;
use wallet::{connector, pb};

#[allow(non_snake_case)]
#[no_mangle]
pub extern "system" fn Java_com_example_wallet_1flutter_MainActivity_getWallet(
    // Java environment.
    env: JNIEnv,
    // Static class which owns this method.
    _class: JClass,

    input: jbyteArray,
) -> jbyteArray {
    let inputs = protobuf::parse_from_bytes::<pb::wallet::GetWalletsRequest>(
        &env.convert_byte_array(input).unwrap(),
    )
    .unwrap();

    let mnemonic = inputs.mnemonic;
    let configs = inputs.configs.unwrap();

    // func -> rust struct -> protobuf -> vector
    let v: Vec<u8> = connector::get_wallets(&configs, mnemonic)
        .write_to_bytes()
        .unwrap();
    // vector -> java array
    env.byte_array_from_slice(&v).unwrap()
}

#[allow(non_snake_case)]
#[no_mangle]
pub extern "system" fn Java_com_example_wallet_1flutter_MainActivity_genSendTransaction(
    // Java environment.
    env: JNIEnv,
    // Static class which owns this method.
    _class: JClass,

    input: jbyteArray,
) -> jbyteArray {
    let inputs = protobuf::parse_from_bytes::<pb::transaction::GenSendTransactionRequest>(
        &env.convert_byte_array(input).unwrap(),
    )
    .unwrap();

    let config = inputs.config.unwrap();
    let outputs = inputs.outputs.unwrap();
    let private_key = inputs.private_key;
    let public_key = inputs.public_key;
    let tx_opts = inputs.tx_opts.unwrap();

    let tx_hex =
        connector::gen_send_transaction(&config, private_key, public_key, outputs, tx_opts);

    let v: Vec<u8> = pb::transaction::Tx {
        tx_hex,
        ..Default::default()
    }
    .write_to_bytes()
    .unwrap();

    env.byte_array_from_slice(&v).unwrap()
}
