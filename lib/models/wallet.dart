import 'package:json_annotation/json_annotation.dart';

part 'wallet.g.dart';

@JsonSerializable()

class Wallet {
  Wallet(this.id, this.mnemonic, this.seedHex);

  int id;
  String mnemonic;
  String seedHex;

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  Map<String, dynamic> toJson() => _$WalletToJson(this);
}