import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/constants.dart';
import 'package:wallet_flutter/gen/cargo/protos/coin.pb.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:wallet_flutter/models/balance.dart';
import 'package:bip39/bip39.dart' as bip39;

// Include generated file
part 'wallet.g.dart';


const platform = const MethodChannel('flutter.dev/rust');
final storage = new FlutterSecureStorage();

// This is the class used by rest of your codebase
class WalletStore = _WalletStore with _$WalletStore;


abstract class _WalletStore with Store {
  
  @observable
  Wallets ws = Wallets();
  
  @observable
  int walletIndex = 0;
  
  @observable

  List<Balances> bl = [];

  @action
  Future<void> initPrep() async{
    this.ws = await initWalletIfAbsent();
    this.bl = await initFetchBalances();
  }

  @action
  Future<List<Balances>> initFetchBalances() async{
    var url = '$explorerApi/get_balances';
    Map<String, String> headers = {"Content-type": "application/json"};
    List<BalParams> bp = [];
    ws.list[this.walletIndex].coinsList.list.forEach((l) => {
      l.coin.forEach((c) => {
        bp.add(BalParams(rel: c.rel, base: c.base, protocol: c.protocol, address: c.address))
      })
    });
    var response = await http.post(url, headers: headers, body: jsonEncode(bp));
    return (jsonDecode(response.body) as List).map((e) => Balances.fromJson(e)).toList();
  }
}

String replaceAll(String str, String r, String w){
    return str.replaceAll(new RegExp(r), w);
}

Future<Wallets> initWalletIfAbsent() async {
    //storage.deleteAll();
    const String key = "wallets";
    String walletsJson = await storage.read(key: key);
      
    String mnemonic = "";
    Wallets ws = Wallets();
    if(walletsJson == null){
      mnemonic = bip39.generateMnemonic();
      //mnemonic = "connect ritual news sand rapid scale behind swamp damp brief explain ankle";
      
      
      Tickers t = getTickers();
      var x = await platform.invokeMethod('get_wallets',{
       "mnemonic": mnemonic,
       "tickers": t.writeToBuffer(),
       "isTestnet": isTestnet,
      });
      Wallet w = Wallet();
      w.coinsList = new CoinsList.fromBuffer(x);
      w.mnemonic = mnemonic;

      ws.list.add(w);
      storage.write(key: key, value: ws.writeToJson());
    }else{
      ws = Wallets.fromJson(walletsJson);
    }
    return ws;
}
Tickers getTickers(){
      Map<String, List<String>> a = {
        "btc": ["btc"],
        "eth": ["eth"],
        "eos": ["eos"],
        "xlm": ["xlm"],
        "xrp": ["xrp"],
        "neo": ["neo", "ont"],
      };
      Tickers t = Tickers();
      a.forEach((k, v) {
          Ticker t1 = Ticker();
          t1.rel.addAll(v);
          t1.base = k;
          t.list.add(t1);
      }); 
      return t;
}
