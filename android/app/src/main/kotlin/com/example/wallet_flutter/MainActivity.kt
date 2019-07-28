package com.example.wallet_flutter

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

import kotlinx.serialization.*
import kotlinx.serialization.json.JSON


@Serializable
data class Wallet(val private_key: String, val public_key: String, val wif: String, val address: String, val ticker: String)

class MainActivity: FlutterActivity() {
  private val CHANNEL = "flutter.dev/rust"  
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    RustJNI()
    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->

      when(call.method) {
        "gen_send_transaction" -> {
          val tx_outputs: String? = call.argument("tx_outputs")
          println(tx_outputs)

          //Dart(call.argument) sends nullable arguments so kotlin mad
          //i'm sure there's better way to do it but not a kotlin person
          /* 
            val outputs = arrayOfNulls<Outputs>(addresses.size)
            for(i in 0..addresses.size){
              //outputs.add(Outputs(addresses[i], values[i]))
              outputs[i]= Outputs(addresses[i], values[i])
            }
            result.success(C.gen_send_transaction(call.argument("ticker"), call.argument("private_key"), call.argument("public_key"), outputs));
          */
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
