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
  
  @action
  Future<void> initPrep() async{
    ws = await initWalletIfAbsent();
    try { bl = await initFetchBalances(); }catch(e) {} 
  }

  @action
  Future<List<Balances>> initFetchBalances() async{
    var url = '$explorerApi/get_balances';
    Map<String, String> headers = {"Content-type": "application/json"};
    List<BalParams> bp = [];
    ws.list[walletIndex].coinsList.list.forEach((l) => {
      l.list.forEach((c) => {
        bp.add(BalParams(rel: c.rel, base: l.base, address: c.address))
      })
    });
    var response = await http.post(url, headers: headers, body: jsonEncode(bp));
    return (jsonDecode(response.body) as List).map((e) => Balances.fromJson(e)).toList();
  }
  
  BalanceOutput getBalance({String rel, String base}){
      if (bl.length == 0) {
        return BalanceOutput(balance: 0.0, fiat: 0.0);
      }
      var x = bl.singleWhere((b) => b.base == base).balances.singleWhere((b)=> b.rel == rel);
      return BalanceOutput(balance: x.value, fiat: x.value*x.fiat);
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
      
      
      Configs c = getConfigs();
      var x = await platform.invokeMethod('get_wallets',{
       "mnemonic": mnemonic,
       "configs": c.writeToBuffer()
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
Configs getConfigs(){
    var c = Configs();
    configs.forEach((x){ c.list.add(x); });
    return c;
}