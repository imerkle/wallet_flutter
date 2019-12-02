import 'package:plugfox_localstorage/localstorage.dart';
import 'package:universal_io/prefer_universal/io.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:wallet_flutter/gen/cargo/protos/coin.pb.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:web_socket_channel_shared/web_socket_channel.dart';

class Rust {
  MethodChannel platform = const MethodChannel('flutter.dev/rust');
  WebSocketChannel channel;

  initWebsocket() async {
    var server = await HttpServer.bind('127.0.0.1', 4040);
    await for (var req in server) {
      if (req.uri.path == '/ws') {
        // Upgrade a HttpRequest to a WebSocket connection.
        var socket = await WebSocketTransformer.upgrade(req);
        socket.listen((message) async {
          WebPlatformChannel x = WebPlatformChannel.fromBuffer(message);
          if (x.methodName == SYNC_WALLETS) {
            final LocalStorage storage = new LocalStorage();
            socket.add(storage[SYNC_WALLETS]);
          } else {
            var y = await invokeRustDirect(x.methodName, x.input);
            socket.add(y);
          }
        });
      }
    }
  }

  void initChannel() {
    //channel = WebSocketChannel.platform('ws://connect.websocket.in/$APPNAME?room_id=$roomId');
    if (kIsWeb) {
      channel = WebSocketChannel.platform('ws://127.0.0.1:4040/ws');
    } else {
      initWebsocket();
    }
  }

  /// Mobile will call rust then return it
  /// Web cannot call rust so web will call mobile using websocket
  /// Send encrypted data which decrypted on mobile
  /// Send result bytes back to web encrypted
  /// Then decrypt it on web
  /// return it
  Future<dynamic> invokeRustMethod(String methodName, dynamic input) async {
    if (!kIsWeb) {
      var x = await invokeRustDirect(methodName, input);
      return x;
    } else {
      var wpc = WebPlatformChannel()
        ..methodName = methodName
        ..input = input;
      channel.sink.add(wpc.writeToBuffer());
      var message = await channel.stream.first;
      return message;
    }
  }

  Future<dynamic> invokeRustDirect(
    String methodName,
    dynamic input,
  ) async {
    return await platform.invokeMethod(methodName, {
      "input": input,
    });
  }
}
