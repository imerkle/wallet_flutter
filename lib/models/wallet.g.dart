// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return Wallet(
    id: json['id'] as int,
    mnemonic: json['mnemonic'] as String,
    seedHex: json['seedHex'] as String,
    coins: (json['coins'] as List)
        ?.map(
            (e) => e == null ? null : Coin.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )..private_key = json['private_key'] as String;
}

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'id': instance.id,
      'mnemonic': instance.mnemonic,
      'seedHex': instance.seedHex,
      'private_key': instance.private_key,
      'coins': instance.coins,
    };
