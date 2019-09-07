package com.example.wallet_flutter

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

import kotlinx.serialization.*
import kotlinx.serialization.json.JSON


@Serializable
data class Wallet(val private_key: String, val public_key: String, val wif: String, val address: String, val ticker: String)

@Serializable
data class TxOutputs(val address: String, val value: Long)

class MainActivity: FlutterActivity() {
  private val CHANNEL = "flutter.dev/rust"  
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    System.loadLibrary("walletjni")


    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->

      when(call.method) {
        "gen_send_transaction" -> {
          val rel: String = call.argument("rel") ?: ""
          val api: String = call.argument("api") ?: ""
          val isTestnet: Boolean = call.argument("isTestnet") ?: false
          val privateKey: ByteArray = call.argument("privateKey") ?: ByteArray(0)
          val publicKey: ByteArray = call.argument("publicKey") ?: ByteArray(0)
          val txOutputs: ByteArray = call.argument("txOutputs") ?: ByteArray(0)
          
          val x = genSendTransaction(rel, isTestnet, api, privateKey, publicKey, txOutputs)
          result.success(x)
        }
        "get_wallets" -> {
          val mnemonic: String = call.argument("mnemonic") ?: ""
          val tickers: ByteArray = call.argument("tickers") ?: ByteArray(0)
          val isTestnet: Boolean = call.argument("isTestnet") ?: false
          val x = getWallet(tickers, mnemonic, isTestnet)      
          result.success(x)
        }
      }
    }
  }
  external fun getWallet(a: ByteArray, b: String, c: Boolean): ByteArray
  external fun genSendTransaction(a: String, b: Boolean, c: String, d: ByteArray, e: ByteArray, f: ByteArray): ByteArray
}
