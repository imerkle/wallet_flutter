import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable()
class Transaction {
  Transaction(
      {this.address,
      this.from,
      this.hash,
      this.value,
      this.kind,
      this.fee,
      this.timestamp,
      this.confirmations});

  String address;
  String from;
  String hash;
  int value;
  String kind;
  int fee;
  int timestamp;
  int confirmations;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
