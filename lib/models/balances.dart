import 'package:json_annotation/json_annotation.dart';
import 'package:wallet_flutter/models/balance.dart';

part 'balances.g.dart';

@JsonSerializable()
class Balances {
  String base;
  List<Balance> balances;

  Balances({this.base, this.balances});


  factory Balances.fromJson(Map<String, dynamic> json) => _$BalancesFromJson(json);

  Map<String, dynamic> toJson() => _$BalancesToJson(this);
}
