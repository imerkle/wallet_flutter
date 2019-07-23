import 'package:json_annotation/json_annotation.dart';
import 'package:wallet_flutter/models/coin.dart';

part 'wallet.g.dart';

@JsonSerializable()

class Wallet {
  Wallet({this.id, this.mnemonic, this.seedHex, this.coins});

  int id;
  String mnemonic;
  String seedHex;
  String private_key;
  List<Coin> coins;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  Map<String, dynamic> toJson() => _$WalletToJson(this);
}