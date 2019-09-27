import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:wallet_flutter/gen/cargo/protos/coin.pbserver.dart';
import 'package:wallet_flutter/models/config.dart';

final bool isTestnet = true;
final int CRYPTO_PRECISION = 8;
final int FIAT_PRECISION = 2;
final String explorerApi = kIsWeb ? "http://127.0.0.1:4000/api" : "http://10.0.2.2:4000/api";
final String APPNAME = "Wallet";

Future writePaste(TextEditingController c) async {
  ClipboardData data = await Clipboard.getData("text/plain");
  c.text = data.text;
}
double textToDouble(String text){
    if (text.length == 0){
      return 0.0;
    }
    return double.parse(text);
}
final Map<String, ExplorerConfig> explorer_config_list = {
  "btc": ExplorerConfig(api: "https://tbtc1.trezor.io/api/v2", kind: "trezor"),
  "eth": ExplorerConfig(api: "https://ac-dev0.net:29136/api/v2", kind: "trezorToken"),
  "vet": ExplorerConfig(api: "https://testnet.veforge.com/api", kind: "vet"),
  "xlm": ExplorerConfig(api: "https://horizon-testnet.stellar.org", kind: "xlm"),
  "ont": ExplorerConfig(api: "https://polarisexplorer.ont.io/api/v1", kind: "ont"),
  "xrp": ExplorerConfig(api: "https://s.altnet.rippletest.net:51234", kind: "xrp"),
  "eos": ExplorerConfig(api: "https://api-kylin.eoslaomao.com/v1", kind: "eos"),
  "trx": ExplorerConfig(api: "https://api.shasta.tronscan.org/api", kind: "trx"),
  "bnb": ExplorerConfig(api: "https://testnet-dex.binance.org/api/v1", kind: "bnb"),
};

List<Config> configs = [
  Config()
  ..rel = "btc"
  ..base = "btc" 
  ..protocol = "btc"
  ..code = 1
  ..precision = 8
  ..private = 239
  ..public = 111
  ..prefix = "tb",

  Config()
  ..rel = "eth"
  ..base = "eth"
  ..protocol = "eth"
  ..code = 60
  ..precision = 18
  ..chainId = 3,
];

Map<String, int> precisions  = {
  "btc": 8,
  "eth": 18,
};