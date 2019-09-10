// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Balance _$BalanceFromJson(Map<String, dynamic> json) {
  return Balance(
    rel: json['rel'] as String,
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$BalanceToJson(Balance instance) => <String, dynamic>{
      'rel': instance.rel,
      'value': instance.value,
    };
