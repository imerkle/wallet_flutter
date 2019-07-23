// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return Wallet(
    json['id'] as int,
    json['mnemonic'] as String,
    json['seedHex'] as String,
  );
}

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'id': instance.id,
      'mnemonic': instance.mnemonic,
      'seedHex': instance.seedHex,
    };
