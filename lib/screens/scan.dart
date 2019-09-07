import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_flutter/constants.dart';


class ScanScreen extends StatelessWidget {
  ScanScreen({this.controller, this.onScan});

  TextEditingController controller;
  Function onScan;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Recieving Address',
        prefixIcon: IconButton(
          icon: Icon(Icons.center_focus_weak),
          onPressed: scan
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.content_paste),
          onPressed: () {
            write_paste(this.controller);
          }
        ),
      ),
    );
  }

  Future scan() async {
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
    } on FormatException{
     // setState(() => this.barcode = 'null (User returned using the "back"-button before scanning anything. Result)');
    } catch (e) {
      //setState(() => this.barcode = 'Unknown error: $e');
    }
  }
}