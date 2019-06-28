package com.example.wallet_flutter

class RustJNI {
    companion object {
        init {
            System.loadLibrary("walletjni")
        }
    }
}