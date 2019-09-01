#!/bin/bash

cargo build --target i686-linux-android
cargo build --target aarch64-linux-android

JNILIBS_DIR=$(cd ../android/app/src/main; pwd)/jniLibs
rm -rf $JNILIBS_DIR
mkdir $JNILIBS_DIR
#'x86', 'x86_64', 'armeabi', 'armeabi-v7a', 'arm64-v8a'
mkdir $JNILIBS_DIR/x86
mkdir $JNILIBS_DIR/arm64-v8a

# If get Is `aarch64-linux-android-clang` installed ? 
#make sure ndk-bundle/.../bin has aarch64-linux-android-clang not just aarch64-linux-android28-clang
#need to fix build.rs target variable for this issue later

ln -snf $PWD/../target/i686-linux-android/debug/libwalletjni.so ${JNILIBS_DIR}/x86/libwalletjni.so
ln -snf $PWD/../target/aarch64-linux-android/debug/libwalletjni.so ${JNILIBS_DIR}/arm64-v8a/libwalletjni.so
