import 'package:mobx/mobx.dart';

// Include generated file
part 'coin.g.dart';

// This is the class used by rest of your codebase
class CoinStore = _CoinStore with _$CoinStore;


class Coin{
  Coin(this.ticker);
  String ticker;
}

class CoinBase{
  CoinBase(this.ticker, this.coins);
  String ticker;
  List<Coin> coins;
}
abstract class _CoinStore implements Store {
  @observable
  List<CoinBase> coinbase = [
    CoinBase("BTC", [
      Coin("BTC"),
      Coin("LTC"),
    ]),
    CoinBase("ETH", [
      Coin("ETH"),
    ]),    
  ];
}
