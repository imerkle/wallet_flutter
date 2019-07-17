import 'package:mobx/mobx.dart';

// Include generated file
part 'coin.g.dart';

// This is the class used by rest of your codebase
class CoinStore = _CoinStore with _$CoinStore;


class Coin{
  Coin(this.ticker, this.name);
  String ticker;
  String name;
}

class CoinBase{
  CoinBase(this.ticker, this.coins);
  String ticker;
  List<Coin> coins;
}
abstract class _CoinStore with Store {
  _CoinStore(this.coinbase);
  @observable
  List<CoinBase> coinbase;
}
