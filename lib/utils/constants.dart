import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import '../models/config.dart';

const bool isTestnet = true;
const String SYNC_WALLETS = "sync_wallets";
const int CRYPTO_PRECISION = 8;
const int FIAT_PRECISION = 2;
const String explorerApi =
    kIsWeb ? "http://127.0.0.1:4000/api" : "http://10.0.2.2:4000/api";
const String APPNAME = "Wallet";

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
