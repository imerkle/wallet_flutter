import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Tx {
  Tx({
    this.address,
    this.value,
  });
  String address;
  double value;

  factory Tx.fromJson(Map<String, dynamic> json) => _$TxFromJson(json);

  Map<String, dynamic> toJson() => _$TxToJson(this);
}

@JsonSerializable()
class Transaction {
  Transaction({
    this.id,
    this.inputs,
    this.outputs,
    this.direction,
    this.fees,
    this.timestamp,
    this.confirmations,
  });

  String id;
  List<Tx> inputs;
  List<Tx> outputs;
  int direction;
  double fees;
  int timestamp;
  double confirmations;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
