import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/models/wallet.dart';
import 'package:wallet_flutter/models/wallet_list.dart';
import 'package:wallet_flutter/stores/sort.dart';
import 'package:bip39/bip39.dart' as bip39;

import 'coin.dart';
import 'fab.dart';
part 'main.g.dart';

final storage = new FlutterSecureStorage();
class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  CoinStore coinStore = new CoinStore([
    CoinBase("BTC", [
      Coin("BTC", "Bitcoin"),
      Coin("LTC", "Litecoin"),
    ]),
    CoinBase("ETH", [
      Coin("ETH", "Ethereum"),
    ]),    
  ]);
  FabStore fabStore = new FabStore();
  SortStore sortStore = new SortStore();
  
  @observable
  List<Wallet> wList;

  Future<void> initPrep() async{
    sortStore.sortables.add(Sortable("Coin", true, true));
    sortStore.sortables.add(Sortable("Price", false, true));
    wList = await initWalletIfAbsent();   
  }
}
Future<List<Wallet>> initWalletIfAbsent() async {
    storage.deleteAll();
    const String key = "wallets";
    String walletsJson = await storage.read(key: key);
      
    String mnemonic = "";
    List<Wallet> wList = [];
    if(walletsJson == null){
      mnemonic = bip39.generateMnemonic();
      String seedHex = bip39.mnemonicToSeedHex(mnemonic);

      Wallet w = new Wallet(0, seedHex, mnemonic);
      wList.add(w);
      storage.write(key: key, value: jsonEncode(wList));
    }else{
      wList = WalletList.fromJson(jsonDecode(walletsJson)).wallets;
    }
    return wList;
}

