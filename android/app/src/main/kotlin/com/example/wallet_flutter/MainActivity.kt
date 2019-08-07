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
    RustJNI()
    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->

      when(call.method) {
        "gen_send_transaction" -> {
          val txo: String? = call.argument("tx_outputs")
          val t: String = txo ?: ""
          val tx_outputs: List<TxOutputs> = JSON.parse(TxOutputs.serializer().list, t)
          println(txo)
          val ticker: String? = call.argument("ticker")
          
          val private_key: String? = call.argument("private_key")
          val public_key: String? = call.argument("public_key")

          val outputs = arrayOfNulls<Outputs>(tx_outputs.size)
          for(i in 0..tx_outputs.size-1){
            outputs[i]= Outputs(tx_outputs[i].address, tx_outputs[i].value)
          }
          result.success(C.gen_send_transaction(ticker, private_key, public_key, outputs)); 
        }
        "get_wallets" -> {
          val x = C.get_wallets(call.argument("mnemonic"))
          val myList: MutableList<Wallet> = mutableListOf<Wallet>()
          for(y in x){
            myList.add(Wallet(y.private_key(), y.public_key(), y.wif(), y.address(), y.ticker()))
          }
          val jsonList = JSON.stringify(Wallet.serializer().list, myList)
          result.success(jsonList)
        }
      }
    }
  }
}
