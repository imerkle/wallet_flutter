import 'package:wallet_flutter/models/coin.dart';

class Coinbase{
  Coinbase({this.ticker, this.coins});
  String ticker;
  List<Coin> coins;

  
  factory Coinbase.fromJson(Map<String, dynamic> parsedJson) {
    List<Coin> coins = new List<Coin>();
    coins = parsedJson['coins'].map((i)=> Coin.fromJson(i)).toList();
    return new Coinbase(
       ticker: parsedJson['ticker'],
       coins: coins,
    );
  }
  Map<String, dynamic> toJson() => {
    "ticker": ticker,
    "coins": coins,
  };  
}