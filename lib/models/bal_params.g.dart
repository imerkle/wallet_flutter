// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bal_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalParams _$BalParamsFromJson(Map<String, dynamic> json) {
  return BalParams(
    rel: json['rel'] as String,
    base: json['base'] as String,
    address: json['address'] as String,
  );
}

Map<String, dynamic> _$BalParamsToJson(BalParams instance) => <String, dynamic>{
      'rel': instance.rel,
      'base': instance.base,
      'address': instance.address,
    };
