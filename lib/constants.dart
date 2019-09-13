import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

final bool isTestnet = true;
final int CRYPTO_PRECISION = 8;
final int FIAT_PRECISION = 2;
final String explorerApi = "http://10.0.2.2:4000/api";

Future writePaste(TextEditingController c) async {
  ClipboardData data = await Clipboard.getData("text/plain");
  c.text = data.text;
}