import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/models/wallet.dart';
import 'package:bip39/bip39.dart' as bip39;
//import 'package:wallet_flutter/models/coin.dart';
//import 'package:wallet_flutter/models/coin_list.dart';
import 'package:wallet_flutter/gen/cargo/protos/coin.pb.dart';
import 'package:wallet_flutter/models/coinbase.dart';
import 'package:wallet_flutter/models/wallet_list.dart';
import 'package:flutter/services.dart';

// Include generated file
part 'wallet.g.dart';

const platform = const MethodChannel('flutter.dev/rust');
final storage = new FlutterSecureStorage();

// This is the class used by rest of your codebase
class WalletStore = _WalletStore with _$WalletStore;


abstract class _WalletStore with Store {
  
  @observable
  List<Wallet> wList = [];
    
  @action
  Future<void> initPrep() async{
    wList = await initWalletIfAbsent();   
  }

}


Future<List<Wallet>> initWalletIfAbsent() async {
    storage.deleteAll();
    const String key = "wallets";
    String walletsJson = await storage.read(key: key);
      
    String mnemonic = "";
    List<Wallet> wList = [];
    if(walletsJson == null){
      //mnemonic = bip39.generateMnemonic();
      mnemonic = "connect ritual news sand rapid scale behind swamp damp brief explain ankle";
      String seedHex = bip39.mnemonicToSeedHex(mnemonic);
      
      Tickers t = get_tickers();
      var x = await platform.invokeMethod('get_wallets',{"mnemonic": mnemonic, "tickers": t.writeToBuffer() });
      Coins c = new Coins.fromBuffer(x);
      /*
      var coins = CoinList.fromJson(jsonDecode(x)).coins;
      
      List<Coinbase> coinbaseList = orderCoinbase(coins);
      Wallet w = new Wallet(id: 0, seedHex: seedHex, mnemonic: mnemonic, coinbaseList: coinbaseList);
      wList.add(w);
      storage.write(key: key, value: jsonEncode(wList));
      */
    }else{
      wList = WalletList.fromJson(jsonDecode(walletsJson)).wallets;
    }
    return wList;
}
Tickers get_tickers(){
      Map<String, List<String>> a = {
        "btc": ["btc"],
        "eth": ["eth"],
      };
      Tickers t = Tickers();
      a.forEach((k, v) {
          Ticker t1 = Ticker();
          t1.rel.addAll(v);
          t1.base = k;
          t.ticker.add(t1);
      }); 
      return t;
}

/*
List<Coinbase> orderCoinbase(List<Coin> coins){
  List<Coinbase> coinbaseList = getListOfCoinbase();
  for(var o in coins){
    var index = coinbaseList.indexWhere((coinbase) => coinbase.ticker == o.ticker);
    coinbaseList[index].coins.add(o);
  }
  return coinbaseList;
}
List<Coinbase> getListOfCoinbase(){
  List a = ["BTC", "ETH", "XLM", "XRP", "EOS", "NEO", "ONT"];
  List<Coinbase> c = [];
  for(var x in a){
    List<Coin> cx = [];
    c.add(Coinbase(ticker: x, coins: cx));
  }
  return c;
}
*/