#!/bin/bash

#if [[ $(rustc --print target-list) = *"apple-ios"* ]]; then
    #cargo lipo --release
    #ln -snf $PWD/target/universal/release/libwallet.a ../ios/Flutter/libwallet.a
#fi

JNILIBS_DIR=$(cd ../android/app/src/main; pwd)/jniLibs
rm -rf $JNILIBS_DIR
mkdir $JNILIBS_DIR
mkdir $JNILIBS_DIR/x86

ln -snf $PWD/target/i686-linux-android/release/libwallet.so ${JNILIBS_DIR}/x86/libwallet.so
