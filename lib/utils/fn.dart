import 'dart:math';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:fixnum/fixnum.dart';

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
