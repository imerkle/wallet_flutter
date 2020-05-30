const bool isTestnet = true;
const String SYNC_WALLETS = "sync_wallets";
const int CRYPTO_PRECISION = 8;
const int FIAT_PRECISION = 2;
const String APPNAME = "Wallet";

class GrpcAddress {
  const GrpcAddress({this.host, this.port});
  final String host;
  final int port;
}

const GrpcAddress CHAINS_API = GrpcAddress(host: "10.0.2.2", port: 50051);
