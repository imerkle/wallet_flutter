import 'package:mobx/mobx.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:plugfox_localstorage/localstorage.dart';
import 'package:wallet_flutter/gen/pb/config.pb.dart';
import 'package:wallet_flutter/gen/pb/wallet.pb.dart';
import 'package:wallet_flutter/models/config.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/utils/rust.dart';

import '../utils/constants.dart';

// Include generated file
part 'wallet.g.dart';

// This is the class used by rest of your codebase
class WalletStore = _WalletStore with _$WalletStore;

abstract class _WalletStore with Store {
  _WalletStore({this.parent});
  final MainStore parent;

  @observable
  Wallets ws = Wallets();

  /// Index of the Current Wallet  in Wallet Array
  @observable
  int index = 0;

  @action
  Future<void> init() async {
    parent.storage[GET_WALLET] = null;
    String walletsJson = parent.storage[GET_WALLET];
    if (walletsJson == null || walletsJson.length == 0) {
      addWallet();
    } else {
      ws = Wallets.fromJson(walletsJson);
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
    w
      ..walletKind = WalletKind.BIP32
      ..configs = cnf;
    ws.list.add(w);
    ws = ws;
    index = ws.list.length - 1;
    parent.storage[GET_WALLET] = ws.writeToJson();
  }

  @action
  removeWallet(index) {
    if (ws.list.length > 1) {
      ws.list.removeAt(index);
    }
  }

  @computed
  Wallet get wallet => ws.list[index];

  @computed
  CoinKey get currentCoinKey => wallet.coinkeys.containsKey(parent.fabStore.id)
      ? wallet.coinkeys[parent.fabStore.id]
      : CoinKey();
}
