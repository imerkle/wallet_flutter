import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/stores/sort.dart';

import 'coin.dart';
import 'fab.dart';
part 'main.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  CoinStore coinStore = new CoinStore([
    CoinBase("BTC", [
      Coin("BTC", "Bitcoin"),
      Coin("LTC", "Litecoin"),
    ]),
    CoinBase("ETH", [
      Coin("ETH", "Ethereum"),
    ]),    
  ]);
  FabStore fabStore = new FabStore();
  SortStore sortStore = new SortStore();
  
  void initPrep(){
    sortStore.sortables.add(Sortable("Coin", true, true));
    sortStore.sortables.add(Sortable("Price", false, true));
    callrust();
  }
}
Future<void> callrust() async {
    final String seed_hex = await platform.invokeMethod('get_seed',{"mnemonic": "", "password": ""});
    debugPrint(seed_hex);
}