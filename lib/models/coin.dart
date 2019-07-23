import 'package:json_annotation/json_annotation.dart';

part 'coin.g.dart';

@JsonSerializable()

class Coin {
  Coin({this.public_key, this.private_key});

  String public_key;
  String private_key;

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);

  Map<String, dynamic> toJson() => _$CoinToJson(this);
}