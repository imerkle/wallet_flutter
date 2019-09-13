import 'package:json_annotation/json_annotation.dart';

part 'balance.g.dart';

@JsonSerializable()
class Balance {
  String rel;
  double value;

  Balance({this.rel, this.value});


  factory Balance.fromJson(Map<String, dynamic> json) => _$BalanceFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceToJson(this);
}

@JsonSerializable()
class Balances {
  String base;
  List<Balance> balances;

  Balances({this.base, this.balances});


  factory Balances.fromJson(Map<String, dynamic> json) => _$BalancesFromJson(json);

  Map<String, dynamic> toJson() => _$BalancesToJson(this);
}

@JsonSerializable()
class BalParams {
  String rel;
  String base;
  String protocol;
  String address;

  BalParams({this.rel, this.base, this.protocol, this.address});


  factory BalParams.fromJson(Map<String, dynamic> json) => _$BalParamsFromJson(json);

  Map<String, dynamic> toJson() => _$BalParamsToJson(this);
}

@JsonSerializable()
class PriceParams {
  String fiat;
  List<String> coins;

  PriceParams({this.fiat, this.coins});


  factory PriceParams.fromJson(Map<String, dynamic> json) => _$PriceParamsFromJson(json);

  Map<String, dynamic> toJson() => _$PriceParamsToJson(this);
}
