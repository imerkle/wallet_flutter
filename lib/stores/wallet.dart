import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/gen/cargo/protos/coin.pb.dart';
import 'package:flutter/services.dart';

// Include generated file
part 'wallet.g.dart';

const platform = const MethodChannel('flutter.dev/rust');
final storage = new FlutterSecureStorage();

// This is the class used by rest of your codebase
class WalletStore = _WalletStore with _$WalletStore;


abstract class _WalletStore with Store {
  
  @observable
  Wallets ws = Wallets();
    
  @action
  Future<void> initPrep() async{
    ws = await initWalletIfAbsent();   
  }

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
       "is_testnet": true,
      });
      Wallet w = Wallet();
      w.coinsList = new CoinsList.fromBuffer(x);
      w.mnemonic = mnemonic;

      ws.wallets.add(w);
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
          t.ticker.add(t1);
      }); 
      return t;
}