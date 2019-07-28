// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tx_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TxOutput _$TxOutputFromJson(Map<String, dynamic> json) {
  return TxOutput(
    address: json['address'] as String,
    value: json['value'] as int,
  );
}

Map<String, dynamic> _$TxOutputToJson(TxOutput instance) => <String, dynamic>{
      'address': instance.address,
      'value': instance.value,
    };
