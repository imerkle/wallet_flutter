#!/bin/bash

#if [[ $(rustc --print target-list) = *"apple-ios"* ]]; then
    #cargo lipo --release
    #ln -snf $PWD/target/universal/release/libwalletjni.a ../ios/Flutter/libwalletjni.a
#fi
#cargo build --target i686-linux-android
cargo build --target aarch64-linux-android
#cargo build --target armv7-linux-androideabi

JNILIBS_DIR=$(cd ../android/app/src/main; pwd)/jniLibs
rm -rf $JNILIBS_DIR
mkdir $JNILIBS_DIR
#mkdir $JNILIBS_DIR/x86
mkdir $JNILIBS_DIR/arm64-v8a
#mkdir $JNILIBS_DIR/armeabi

#ln -snf $PWD/target/i686-linux-android/debug/libwalletjni.so ${JNILIBS_DIR}/x86/libwalletjni.so
ln -snf $PWD/target/aarch64-linux-android/debug/libwalletjni.so ${JNILIBS_DIR}/arm64-v8a/libwalletjni.so
#ln -snf $PWD/target/armv7-linux-androideabi/debug/libwalletjni.so ${JNILIBS_DIR}/armeabi/libwalletjni.so
