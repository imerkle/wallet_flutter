/*
package com.example.wallet_flutter

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
  }
}
*/

package com.example.wallet_flutter

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  private val CHANNEL = "flutter.dev/rust"  
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    System.loadLibrary("walletjni")


    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
      val input: ByteArray = call.argument("input") ?: ByteArray(0)
      var x: ByteArray = ByteArray(0);
      when(call.method) {
        "gen_send_transaction" -> x = genSendTransaction(input)
        "get_wallet" -> x = getWallet(input)
      }
      result.success(x)
    }
  }
  external fun getWallet(a: ByteArray): ByteArray
  external fun genSendTransaction(a: ByteArray): ByteArray
}

