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
  
  @observable
  Map<String, dynamic> pl = {};


  @action
  Future<void> initPrep() async{
    ws = await initWalletIfAbsent();
    pl = await initFetchPrices();
    bl = await initFetchBalances();
  }

  @action
  Future<Map<String, dynamic>> initFetchPrices() async{

    var url = '$explorerApi/get_prices';
    Map<String, String> headers = {"Content-type": "application/json"};

    PriceParams pp = PriceParams(fiat: fiat.ticker, coins: tickerStringList());
    var response = await http.post(url, headers: headers, body: jsonEncode(pp));
    return jsonDecode(response.body);
  }
  @action
  Future<List<Balances>> initFetchBalances() async{
    var url = '$explorerApi/get_balances';
    Map<String, String> headers = {"Content-type": "application/json"};
    List<BalParams> bp = [];
    ws.list[walletIndex].coinsList.list.forEach((l) => {
      l.coin.forEach((c) => {
        bp.add(BalParams(rel: c.rel, base: l.base, protocol: l.protocol, address: c.address))
      })
    });
    var response = await http.post(url, headers: headers, body: jsonEncode(bp));
    return (jsonDecode(response.body) as List).map((e) => Balances.fromJson(e)).toList();
  }
  
  double getBalance({String rel, String base}){
      if (bl.length == 0) {
        return 0.0;
      }
      return bl.singleWhere((b) => b.base == base).balances.singleWhere((b)=> b.rel == rel).value;
  }
  double getFiatValue({double balance, String rel}){
    if(pl.containsKey(rel)){
      return pl[rel] * balance;
    }else{
      return 0.0;
    }
  }
}

String replaceAll(String str, String r, String w){
    return str.replaceAll(new RegExp(r), w);
}

Future<Wallets> initWalletIfAbsent() async {
    storage.deleteAll();
    const String key = "wallets";
    String walletsJson = await storage.read(key: key);
      
    String mnemonic = "";
    Wallets ws = Wallets();
    if(walletsJson == null){
      //mnemonic = bip39.generateMnemonic();
      mnemonic = "connect ritual news sand rapid scale behind swamp damp brief explain ankle";
      
      
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
const Map<String, List<String>> TT = {
  "btc": ["btc"],
  "eth": ["eth"],
  "eos": ["eos"],
  "xlm": ["xlm"],
  "xrp": ["xrp"],
  "neo": ["neo"],
  "ont": ["ont"],
};
Tickers getTickers(){
      Tickers t = Tickers();
      TT.forEach((k, v) {
          Ticker t1 = Ticker();
          t1.rel.addAll(v);
          t1.base = k;
          t.list.add(t1);
      }); 
      return t;
}
List<String> tickerStringList(){ 
  List<String> l1 = [];
  TT.forEach((k, v){
    l1 = new List.from(l1)..addAll(v);
  });
  return l1;
}