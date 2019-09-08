import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:wallet_flutter/gen/cargo/protos/coin.pb.dart';
import 'package:wallet_flutter/stores/wallet.dart';

final bool isTestnet = true;
final String explorerApi = "http://10.0.2.2:4000/api";

Future write_paste(TextEditingController c) async {
  ClipboardData data = await Clipboard.getData("text/plain");
  c.text = data.text;
}

Coin getCoin({WalletStore store, int walletIndex = 0, int baseIndex, int relIndex}){
    return store.ws.list[walletIndex].coinsList.list[baseIndex].coin[relIndex];
}
List<Coin> getCoinList({WalletStore store, int walletIndex = 0, int baseIndex}){
    return store.ws.list[walletIndex].coinsList.list[baseIndex].coin;
}