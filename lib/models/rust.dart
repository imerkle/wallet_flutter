import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:wallet_flutter/gen/cargo/protos/coin.pb.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:web_socket_channel_shared/web_socket_channel.dart';

class Rust{
  MethodChannel platform = const MethodChannel('flutter.dev/rust');
  WebSocketChannel channel;
  int roomId = 100;  //change to random

  Function tmpFn;
  void initChannel(){
    channel = WebSocketChannel.platform('ws://connect.websocket.in/$APPNAME?room_id=$roomId');
    if(!kIsWeb){
      channel.stream.listen((message) async {
        WebPlatformChannel x = WebPlatformChannel.fromJson(message);
        var y = await invokeRustDirect(x.methodName, x.input);
        var z = WebPlatformChannel()
        ..input = y;
        channel.sink.add(z.writeToJson());
      });
    }else{
      channel.stream.listen((message){
        WebPlatformChannel x = WebPlatformChannel.fromJson(message);
        tmpFn(x.input);
      });      
    }
  }
  /// Mobile will call rust then return ir
  /// Web cannot call rust so web will call mobile using websocket
  /// Send encrypted data which decrypted on mobile
  /// Send result bytes back to web encrypted 
  /// Then decrypt it on web 
  /// return it
  void invokeRustMethod(String methodName, dynamic input, Function callback) async {
    if(!kIsWeb){
      var x = await invokeRustDirect(methodName, input);
      callback(x);
    }else{
      var wpc = WebPlatformChannel()
      ..methodName = methodName
      ..input = input;
      tmpFn = callback;
      channel.sink.add(wpc.writeToJson());
    }
  }
  Future<dynamic> invokeRustDirect(String methodName, dynamic input,) async {
      return await platform.invokeMethod(methodName,{
        "input": input,
      });    
  }
}