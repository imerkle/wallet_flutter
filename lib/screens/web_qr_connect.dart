import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../utils/constants.dart';

TextStyle t = TextStyle(height: 3, fontSize: 16);

class WebQrConnect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("To use $APPNAME on your computer:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                Text("1. Open $APPNAME in your phone", style: t),
                Text("2. Goto Settings and tap Connect to Web", style: t),
                Text("3. Scan the QR code using your phone", style: t),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            child: QrImage(
              data: "1234567890",
              size: 250,
            ),
          ),
        ],
      ),
    ));
  }
}
