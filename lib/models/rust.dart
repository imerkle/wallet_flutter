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
  void initChannel(){
    channel = WebSocketChannel.platform('ws://connect.websocket.in/$APPNAME?room_id=$roomId');
    if(!kIsWeb){
      channel.stream.listen((message) async {
        WebPlatformChannel x = WebPlatformChannel.fromJson(message);
        var y = await invokeRustMethod(x.methodName, x.input);
        var z = WebPlatformChannel()
        ..input = y;
        channel.sink.add(z.writeToJson());
        channel.sink.close();
      });
    }else{
      channel.stream.listen((message){
        WebPlatformChannel x = WebPlatformChannel.fromJson(message);
        print(x);
      });
    }
  }
  /// Mobile will call rust then return ir
  /// Web cannot call rust so web will call mobile using websocket
  /// Send encrypted data which decrypted on mobile
  /// Send result bytes back to web encrypted 
  /// Then decrypt it on web 
  /// return it
  Future<dynamic> invokeRustMethod(String methodName, dynamic input) async {
    if(!kIsWeb){
      return await platform.invokeMethod(methodName,{
        "input": input,
      });
    }else{
      var wpc = WebPlatformChannel()
      ..methodName = methodName
      ..input = input;
      channel.sink.add(wpc.writeToJson());
    }
  }
}