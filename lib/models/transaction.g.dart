// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    address: json['address'] as String,
    from: json['from'] as String,
    hash: json['hash'] as String,
    value: json['value'] as int,
    kind: json['kind'] as String,
    fee: json['fee'] as int,
    timestamp: json['timestamp'] as int,
    confirmations: json['confirmations'] as int,
  );
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'address': instance.address,
      'from': instance.from,
      'hash': instance.hash,
      'value': instance.value,
      'kind': instance.kind,
      'fee': instance.fee,
      'timestamp': instance.timestamp,
      'confirmations': instance.confirmations,
    };
