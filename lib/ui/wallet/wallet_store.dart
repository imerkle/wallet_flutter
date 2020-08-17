import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:plugfox_localstorage/localstorage.dart';
import 'package:wallet_flutter/gen/pb/config.pb.dart';
import 'package:wallet_flutter/gen/pb/wallet.pb.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/utils/rust.dart';

// Include generated file
part 'wallet_store.g.dart';

class WalletStore = _WalletStore with _$WalletStore;

abstract class _WalletStore with Store {
  _WalletStore({this.parent});
  final MainStore parent;

  /// List of wallets
  ObservableList<Wallet> wallets = ObservableList.of([]);

  /// Index of the Current Wallet  in Wallet Array
  @observable
  int index = 0;

  @computed
  Wallet get wallet => wallets[index];

  @computed
  Option get option => wallet.options[parent.folderStore.id];

  @computed
  CoinKey get currentCoinKey =>
      wallet.coinkeys.containsKey(parent.folderStore.id)
          ? wallet.coinkeys[parent.folderStore.id]
          : CoinKey();

  @action
  Future<void> init() async {
    parent.storage[GET_WALLET] = null;
    String walletsJson = parent.storage[GET_WALLET];
    if (walletsJson == null || walletsJson.length == 0) {
      addWallet();
    } else {
      //wallets = Wallets.fromJson(walletsJson);
    }
  }

  @action
  Future<void> addWallet({String mnemonic}) async {
    Configs cnf = Configs()..list.addAll(parent.configStore.configsForWallet);
    if (mnemonic == null) {
      mnemonic = bip39.generateMnemonic();
    }
    /*
    String mnemonic = "connect ritual news sand rapid scale behind swamp damp brief explain ankle";
    */
    var input = GetWalletsRequest()
      ..mnemonic = mnemonic
      ..configs = cnf;
    dynamic x =
        await parent.rust.invokeRustMethod(GET_WALLET, input.writeToBuffer());
    Wallet w = Wallet.fromBuffer(x);
    w..walletKind = WalletKind.BIP32;
    w..options.addAll(parent.configStore.options);

    wallets.add(w);
    index = wallets.length - 1;
    parent.storage[GET_WALLET] = w.writeToJson();
  }

  @action
  removeWallet(index) {
    if (wallets.length > 1) {
      wallets.removeAt(index);
    }
  }
}
