import 'dart:convert';
import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:localstorage/localstorage.dart';
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/models/rust.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/gen/cargo/protos/coin.pb.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:wallet_flutter/models/balance.dart';
import 'package:bip39/bip39.dart' as bip39;

// Include generated file
part 'wallet.g.dart';


final LocalStorage storage = new LocalStorage(APPNAME);

// This is the class used by rest of your codebase
class WalletStore = _WalletStore with _$WalletStore;


class Fiat{
  Fiat({this.symbol, this.ticker});
  String symbol;
  String ticker;
}
abstract class _WalletStore with Store {
  
  @observable
  Wallets ws = Wallets();
  
  
  @observable int walletIndex = 0;
  @observable Fiat fiat = Fiat(symbol: "\$", ticker: "usd");
  
  @observable
  List<Balances> bl = [];
  
  @action
  Future<void> initPrep(Rust rust) async{
    ws = await initWalletIfAbsent(rust);
    await refreshBalances();
  }

  @action
  Future<void> refreshBalances() async{
    try {  bl = await initFetchBalances(); }catch(e) {}
  }

  Future<List<Balances>> initFetchBalances() async{
    var url = '$explorerApi/get_balances';
    Map<String, String> headers = {"Content-type": "application/json"};
    List<Map<String, String>> bp = [];
    ws.list[walletIndex].coinsList.list.forEach((l) => {
      l.list.forEach((c) => {
        bp.add({
          "api": explorer_config_list[c.rel].api,
          "kind": explorer_config_list[c.rel].kind,
          "rel": c.rel,
          "base": l.base,
          "address": c.address,
        })
      })
    });
    var response = await http.post(url, headers: headers, body: jsonEncode({
      "fiat": fiat.ticker,
      "list": bp,
    }));
    return (jsonDecode(response.body) as List).map((e) => Balances.fromJson(e)).toList();
  }
  
  BalanceOutput getBalance({String rel, String base}){
      if (bl.length == 0) {
        return BalanceOutput(balance: 0.0, fiat: 0.0);
      }
      var x = bl.singleWhere((b) => b.base == base).balances.singleWhere((b)=> b.rel == rel);
      var value = x.value/pow(10,precisions[rel]);
      return BalanceOutput(balance: value, fiat: value*x.fiat);
  }
}

String replaceAll(String str, String r, String w){
    return str.replaceAll(new RegExp(r), w);
}

Future<Wallets> initWalletIfAbsent(Rust rust) async {
    storage.clear();
    //storage.deleteAll();
    const String key = "wallets";
    //String walletsJson = await storage.read(key: key);
    String walletsJson = storage.getItem(key);
      
    String mnemonic = "";
    Wallets ws = Wallets();
    if(walletsJson == null){
      //mnemonic = bip39.generateMnemonic();
      mnemonic = "connect ritual news sand rapid scale behind swamp damp brief explain ankle";

      var input = GetWalletInput()
      ..mnemonic = mnemonic
      ..configs = getConfigs();
      var x = await rust.invokeRustMethod("get_wallets", input.writeToBuffer());

      Wallet w = Wallet()
      ..coinsList = CoinsList.fromBuffer(x)
      ..mnemonic = mnemonic;

      ws.list.add(w);
      //storage.write(key: key, value: ws.writeToJson());
      storage.setItem(key, ws.writeToJson());
    }else{
      ws = Wallets.fromJson(walletsJson);
    }
    return ws;
}
Configs getConfigs(){
    var c = Configs();
    configs.forEach((x){ c.list.add(x); });
    return c;
}