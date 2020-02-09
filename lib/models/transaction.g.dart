// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tx _$TxFromJson(Map<String, dynamic> json) {
  return Tx(
    address: json['address'] as String,
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TxToJson(Tx instance) => <String, dynamic>{
      'address': instance.address,
      'value': instance.value,
    };

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction(
    id: json['id'] as String,
    inputs: (json['inputs'] as List)
        ?.map((e) => e == null ? null : Tx.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    outputs: (json['outputs'] as List)
        ?.map((e) => e == null ? null : Tx.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    direction: json['direction'] as int,
    fees: (json['fees'] as num)?.toDouble(),
    timestamp: (json['timestamp'] as num)?.toInt(),
    confirmations: (json['confirmations'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'inputs': instance.inputs,
      'outputs': instance.outputs,
      'direction': instance.direction,
      'fees': instance.fees,
      'timestamp': instance.timestamp,
      'confirmations': instance.confirmations,
    };
