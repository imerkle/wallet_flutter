import 'dart:math';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter/widgets.dart';
import 'package:grpc/grpc.dart';
import 'package:wallet_flutter/utils/web_stub.dart'
    if (dart.library.html) "package:grpc/grpc_web.dart";

import 'constants.dart';

Future scan(Function onScan) async {
  try {
    String barcode = await BarcodeScanner.scan();
    onScan(barcode);
    //setState(() => this.barcode = barcode);
  } on PlatformException catch (e) {
    if (e.code == BarcodeScanner.CameraAccessDenied) {
      /*setState(() {
        this.barcode = 'The user did not grant the camera permission!';
      });
      */
    } else {
      //setState(() => this.barcode = 'Unknown error: $e');
    }
  } on FormatException {
    // setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
  } catch (e) {
    //setState(() => this.barcode = 'Unknown error: $e');
  }
}

double valueToPrecision(Int64 value, int precision) {
  return value.toDouble() / pow(10, precision);
}

String valueToPretty(double n, int precision) {
  String str = n.toStringAsFixed(precision);
  RegExp exp = RegExp(r"0+$");
  String matches = str.replaceAll(exp, "");
  if (matches == "0." || matches == "") {
    return "0";
  }
  return matches;
}

String replaceAll(String str, String r, String w) {
  return str.replaceAll(new RegExp(r), w);
}

String smartTrim(String string, int maxLength) {
  if (maxLength < 1) return string;
  if (string.length <= maxLength) return string;
  if (maxLength == 1) return string.substring(0, 1) + '...';

  var midpoint = (string.length / 2).ceil();
  var toremove = string.length - maxLength;
  var lstrip = (toremove / 2).ceil();
  var rstrip = toremove - lstrip;
  return string.substring(0, midpoint - lstrip) +
      '...' +
      string.substring(midpoint + rstrip);
}

Future writePaste(TextEditingController c) async {
  ClipboardData data = await Clipboard.getData("text/plain");
  c.text = data.text;
}

double textToDouble(String text) {
  if (text.length == 0) {
    return 0.0;
  }
  return double.parse(text);
}

dynamic getGrpcClientChannel(GrpcAddress address) {
  dynamic channel;
  if (kIsWeb) {
    // https://github.com/grpc/grpc-dart/issues/264
    channel = GrpcWebClientChannel.xhr(
        Uri.parse('http://${address.host}:${address.port}'));
  } else {
    channel = ClientChannel(address.host,
        port: address.port,
        options: ChannelOptions(credentials: ChannelCredentials.insecure()));
  }
  return channel;
}

String cryptoIconUrl(String ticker, {int size = 128, String color = "color"}) {
  return 'https://raw.githack.com/atomiclabs/cryptocurrency-icons/master/$size/$color/${ticker.toLowerCase()}.png';
}

Color darken(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var f = 1 - percent / 100;
  return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(),
      (c.blue * f).round());
}

Color brighten(Color c, [int percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var p = percent / 100;
  return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round());
}
