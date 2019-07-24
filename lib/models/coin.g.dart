// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coin _$CoinFromJson(Map<String, dynamic> json) {
  return Coin(
    public_key: json['public_key'] as String,
    private_key: json['private_key'] as String,
    wif: json['wif'] as String,
    address: json['address'] as String,
    ticker: json['ticker'] as String,
  );
}

Map<String, dynamic> _$CoinToJson(Coin instance) => <String, dynamic>{
      'public_key': instance.public_key,
      'private_key': instance.private_key,
      'wif': instance.wif,
      'address': instance.address,
      'ticker': instance.ticker,
    };
