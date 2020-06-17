import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const bool isTestnet = true;
const String GET_WALLET = "get_wallet";
const int CRYPTO_PRECISION = 8;
const int FIAT_PRECISION = 2;
const String APPNAME = "Wallet";

class GrpcAddress {
  const GrpcAddress({this.host, this.port});
  final String host;
  final int port;
}

const GrpcAddress CHAINS_API = kIsWeb
    ? GrpcAddress(host: "chains.example.com", port: 80)
//    : GrpcAddress(host: "10.0.2.2", port: 50051);
    : GrpcAddress(host: "chains.example.com", port: 80);

extension CustomColorScheme on ThemeData {
  Color get primaryColorDarker => const Color(0xff202225);
  Color get primaryColorLighter => const Color(0xff393c42);
  Color get masterColor => const Color(0xff7289da);
}

extension CustomColorScheme1 on TextTheme {
  TextStyle get headerGrey1 => TextStyle(
        color: const Color(0xff8e9297),
        fontWeight: FontWeight.bold,
        fontSize: 12,
      );
}
