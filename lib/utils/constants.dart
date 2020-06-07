import 'package:flutter/foundation.dart';

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
    ? GrpcAddress(host: "127.0.0.1", port: 50051)
    : GrpcAddress(host: "10.0.2.2", port: 50051);
