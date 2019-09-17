import 'package:json_annotation/json_annotation.dart';

part 'balance.g.dart';

@JsonSerializable()
class Balance {
  String rel;
  double value;
  double fiat;

  Balance({this.rel, this.value, this.fiat});


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
  String address;

  BalParams({this.rel, this.base, this.address});


  factory BalParams.fromJson(Map<String, dynamic> json) => _$BalParamsFromJson(json);

  Map<String, dynamic> toJson() => _$BalParamsToJson(this);
}
class BalanceOutput{
  double balance;
  double fiat;

  BalanceOutput({this.balance, this.fiat});
}