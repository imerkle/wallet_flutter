import 'dart:ui';

import 'package:flutter/foundation.dart';

const bool isTestnet = true;
const String GET_WALLET = "get_wallet";
const int CRYPTO_PRECISION = 8;
const int FIAT_PRECISION = 2;
const String APPNAME = "Wallet";

const primaryColor = const Color.fromRGBO(32, 34, 37, 1);
const secondaryColor = const Color.fromRGBO(57, 60, 66, 1);
const masterColor = const Color.fromRGBO(114, 137, 218, 1);
const sunkColor = const Color.fromRGBO(47, 50, 55, 1);

class GrpcAddress {
  const GrpcAddress({this.host, this.port});
  final String host;
  final int port;
}

const GrpcAddress CHAINS_API = kIsWeb
    ? GrpcAddress(host: "chains.example.com", port: 80)
//    : GrpcAddress(host: "10.0.2.2", port: 50051);
    : GrpcAddress(host: "chains.example.com", port: 80);
