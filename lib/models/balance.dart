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
