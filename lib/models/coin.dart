import 'package:json_annotation/json_annotation.dart';

part 'coin.g.dart';

@JsonSerializable()

class Coin {
  Coin({this.public_key, this.private_key, this.wif, this.address, this.ticker});

  String public_key;
  String private_key;
  String wif;
  String address;
  String ticker;

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);

  Map<String, dynamic> toJson() => _$CoinToJson(this);
}

