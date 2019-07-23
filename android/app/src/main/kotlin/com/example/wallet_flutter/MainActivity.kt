package com.example.wallet_flutter

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

import kotlinx.serialization.*
import kotlinx.serialization.json.JSON


@Serializable
data class Wallet(val private_key: String, val public_key: String, val wif: String, val address: String)

class MainActivity: FlutterActivity() {
  private val CHANNEL = "flutter.dev/rust"  
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    RustJNI()
    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
      when(call.method) {
        "get_wallets" -> {
          var x = C.get_wallets(call.argument("mnemonic"))
          var myList: MutableList<Wallet> = mutableListOf<Wallet>()
          for(y in x){
            myList.add(Wallet(y.private_key(), y.public_key(), y.wif(), y.address()))
          }
          val jsonList = JSON.stringify(Wallet.serializer().list, myList)
          result.success(jsonList)
        }
      }
    }
  }
}
