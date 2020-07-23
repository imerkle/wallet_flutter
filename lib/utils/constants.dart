import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallet_flutter/ui/folders/folder_store.dart';

import 'fn.dart';

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

const primaryColorLighterColor = const Color(0xff393c42);
const masterColorColor = const Color(0xff7289da);
const primaryColorDarkerColor = const Color(0xff202225);

extension CustomColorScheme on ThemeData {
  Color get primaryColorDarker => primaryColorDarkerColor;
  Color get primaryColorDarker30 => darken(primaryColorDarkerColor, 30);
  Color get primaryColorLighter => primaryColorLighterColor;
  Color get primaryColorLighter30 => darken(primaryColorLighterColor, 30);
  Color get masterColor => masterColorColor;
  Color get masterColor30 => darken(masterColorColor);
}

extension CustomColorScheme1 on TextTheme {
  TextStyle get headerGrey1 => TextStyle(
        color: const Color(0xff8e9297),
        fontWeight: FontWeight.bold,
        fontSize: 12,
      );
  TextStyle get headerGrey2 => TextStyle(
        color: const Color(0xff8e9297),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      );
  TextStyle get headerGrey3 => TextStyle(
        color: const Color(0xff8e9297),
        fontSize: 14,
      );
  TextStyle get headerGrey4 => TextStyle(
        color: const Color(0xff8e9297),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      );
  TextStyle get headerMaster => TextStyle(
        color: const Color(0xff7289da),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
}

var DEFAULT_FOLDERS = [
  Folder(ids: ["btc", "btg"], name: "Bitcoin", logo: cryptoIconUrl("btc")),
  Folder(ids: ["eth"], name: "Ethereum", logo: cryptoIconUrl("eth")),
];
