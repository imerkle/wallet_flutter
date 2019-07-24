import 'package:wallet_flutter/models/coin.dart';

class CoinList {
  final List<Coin> coins;

  CoinList({
    this.coins,
  });
  
  factory CoinList.fromJson(List<dynamic> parsedJson) {
    List<Coin> coins = new List<Coin>();
    coins = parsedJson.map((i)=> Coin.fromJson(i)).toList();
    return new CoinList(
       coins: coins,
    );
  }


}