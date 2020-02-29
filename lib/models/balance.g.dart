// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Balance _$BalanceFromJson(Map<String, dynamic> json) {
  return Balance(
    rel: json['rel'] as String,
    value: (json['value'] as num)?.toDouble(),
    price: (json['price'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$BalanceToJson(Balance instance) => <String, dynamic>{
      'rel': instance.rel,
      'value': instance.value,
      'price': instance.price,
    };

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
