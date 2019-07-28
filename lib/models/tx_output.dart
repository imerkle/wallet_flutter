import 'package:json_annotation/json_annotation.dart';

part 'tx_output.g.dart';

@JsonSerializable()

class TxOutput {
  TxOutput({this.address, this.value});

  String address;
  int value;

  factory TxOutput.fromJson(Map<String, dynamic> json) => _$TxOutputFromJson(json);

  Map<String, dynamic> toJson() => _$TxOutputToJson(this);
}

