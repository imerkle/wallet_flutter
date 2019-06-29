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
    RustJNI()
    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
      // TODO
      result.success(C.get_seed("connect ritual news sand rapid scale behind swamp damp brief explain ankle",""))
    }
  }
}
