import 'package:wallet_flutter/models/wallet.dart';

class WalletList {
  final List<Wallet> wallets;

  WalletList({
    this.wallets,
  });
  
  factory WalletList.fromJson(List<dynamic> parsedJson) {
    List<Wallet> wallets = new List<Wallet>();
    wallets = parsedJson.map((i)=> Wallet.fromJson(i)).toList();
    return new WalletList(
       wallets: wallets,
    );
  }
}