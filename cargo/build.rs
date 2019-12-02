use protoc_rust::Customize;
use std::env;
fn main() {
    // don't simplify this to if the target contains the substring "android" --
    // these lines also serve as a guard so only true android triples receive
    // JNI generation.
    let target = env::var("TARGET").unwrap();
    if [
        "aarch64-linux-android",
        "arm-linux-androideabi",
        "i686-linux-android",
        "x86_64-linux-android",
    ]
    .contains(&target.as_str())
    {
        gen_protobuf();
        //gen_for_android();
    }
}
fn gen_protobuf() {
    protoc_rust::run(protoc_rust::Args {
        out_dir: "src/protos",
        input: &["protos/coin.proto"],
        includes: &["protos"],
        customize: Customize {
            ..Default::default()
        },
    })
    .expect("protoc");
}
