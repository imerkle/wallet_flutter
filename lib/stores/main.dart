import 'package:mobx/mobx.dart';

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
}
