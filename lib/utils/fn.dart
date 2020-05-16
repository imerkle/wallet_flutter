import 'dart:math';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import '../gen/cargo/protos/coin.pb.dart';
import '../utils/constants.dart';

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

double valueToPrecision(double value, int precision) {
  return value / pow(10, precision);
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
