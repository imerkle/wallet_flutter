// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balances.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Balances _$BalancesFromJson(Map<String, dynamic> json) {
  return Balances(
    base: json['base'] as String,
    balances: (json['balances'] as List)
        ?.map((e) =>
            e == null ? null : Balance.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BalancesToJson(Balances instance) => <String, dynamic>{
      'base': instance.base,
      'balances': instance.balances,
    };
