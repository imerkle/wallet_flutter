import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:bip39/bip39.dart' as bip39;
import 'package:plugfox_localstorage/localstorage.dart';
import 'package:wallet_flutter/stores/main.dart';

import '../models/rust.dart';
import '../models/transaction.dart';
import '../utils/constants.dart';
import '../gen/cargo/protos/coin.pb.dart';
import '../models/balance.dart';

// Include generated file
part 'wallet.g.dart';

final LocalStorage storage = new LocalStorage();

// This is the class used by rest of your codebase
class WalletStore = _WalletStore with _$WalletStore;

abstract class _WalletStore with Store {
  @observable
  Wallets ws = Wallets();

  @observable
  int walletIndex = 0;

  Future<void> initPrep(Rust rust) async {
    await storage.init();
    await initWalletIfAbsent(rust);
  }

  @action
  Future<void> initWalletIfAbsent(Rust rust) async {
    storage[SYNC_WALLETS] = null;
    String walletsJson = storage[SYNC_WALLETS];

    String mnemonic = "";

    // For some reason mobx in web doesnt loads when modifying to existing object so replace it completely
    if (walletsJson == null || walletsJson.length == 0) {
      if (kIsWeb) {
        List<int> inp = [];
        var walletsJson = await rust.invokeRustMethod(SYNC_WALLETS, inp);
        ws = Wallets.fromJson(walletsJson);
      } else {
        Wallets wsx = Wallets();
        //mnemonic = bip39.generateMnemonic();
        mnemonic =
            "connect ritual news sand rapid scale behind swamp damp brief explain ankle";

        var input = GetWalletInput()
          ..mnemonic = mnemonic
          ..configs = getConfigs();
        var x =
            await rust.invokeRustMethod("get_wallets", input.writeToBuffer());
        Wallet w = Wallet()
          ..coins = Coins.fromBuffer(x)
          ..mnemonic = mnemonic;
        wsx.list.add(w);
        ws = wsx;
        storage[SYNC_WALLETS] = ws.writeToJson();
      }
    } else {
      ws = Wallets.fromJson(walletsJson);
    }
  }
}

String replaceAll(String str, String r, String w) {
  return str.replaceAll(new RegExp(r), w);
}

Configs getConfigs() {
  var c = Configs();
  configs.forEach((x) {
    c.list.add(x);
  });
  return c;
}
