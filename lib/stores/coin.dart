import 'package:mobx/mobx.dart';

// Include generated file
part 'coin.g.dart';

// This is the class used by rest of your codebase
class CoinStore = _CoinStore with _$CoinStore;


class Coin{
  Coin(this.rel,  this.base);
  String rel;
  String base;
}

abstract class _CoinStore implements Store {
  @observable
  List<Coin> coins = List();

  @action setCoins(List<Coin> c){
    coins = c;
  }
}