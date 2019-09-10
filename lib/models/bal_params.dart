import 'package:json_annotation/json_annotation.dart';

part 'bal_params.g.dart';

@JsonSerializable()

class BalParams {
  String rel;
  String base;
  String address;

  BalParams({this.rel, this.base, this.address});


  factory BalParams.fromJson(Map<String, dynamic> json) => _$BalParamsFromJson(json);

  Map<String, dynamic> toJson() => _$BalParamsToJson(this);
}
