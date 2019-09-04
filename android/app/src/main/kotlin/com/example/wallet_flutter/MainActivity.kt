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
          /*
          val txo: String? = call.argument("tx_outputs")
          val t: String = txo ?: ""
          val tx_outputs: List<TxOutputs> = JSON.parse(TxOutputs.serializer().list, t)
          println(txo)
          val ticker: String? = call.argument("ticker")
          
          val private_key: String? = call.argument("private_key")
          val public_key: String? = call.argument("public_key")

          val outputs = arrayOfNulls<Outputs>(tx_outputs.size)
          for(i in 0..tx_outputs.size-1){
            outputs[i]= Outputs(tx_outputs[i].address, tx_outputs[i].value, "")
          }
          result.success(C.gen_send_transaction(ticker, private_key, public_key, outputs)); 
          */
        }
        "get_wallets" -> {
          val mnemonic: String = call.argument("mnemonic") ?: ""
          val tickers: ByteArray = call.argument("tickers") ?: ByteArray(0)
          val is_testnet: Boolean = call.argument("is_testnet") ?: false
          val x = getWallet(tickers, mnemonic, is_testnet)
          result.success(x)
        }
      }
    }
  }
  external fun getWallet(s: ByteArray, b: String, c: Boolean): ByteArray
}
