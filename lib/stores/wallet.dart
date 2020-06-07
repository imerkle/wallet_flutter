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

final LocalStorage storage = new LocalStorage();

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

  Future<void> initPrep(Map<String, ConfigAtom> configs, Rust rust) async {
    await storage.init();
    await initWalletIfAbsent(configs, rust);
  }

  @action
  Future<void> initWalletIfAbsent(
      Map<String, ConfigAtom> configs, Rust rust) async {
    storage[GET_WALLET] = null;
    String walletsJson = storage[GET_WALLET];

    String mnemonic = "";

    // For some reason mobx in web doesnt loads when modifying to existing object so replace it completely
    if (walletsJson == null || walletsJson.length == 0) {
      Wallets wallets = Wallets();
      Configs cnf = Configs();
      configs.forEach((id, x) => {
            if (x.config.hasProtocol()) {cnf.list.add(x.config)}
          });
      //mnemonic = bip39.generateMnemonic();
      mnemonic =
          "connect ritual news sand rapid scale behind swamp damp brief explain ankle";
      var input = GetWalletsRequest()
        ..mnemonic = mnemonic
        ..configs = cnf;
      dynamic x =
          await rust.invokeRustMethod(GET_WALLET, input.writeToBuffer());
      Wallet w = Wallet.fromBuffer(x);
      wallets.list.add(w);
      ws = wallets;
      storage[GET_WALLET] = ws.writeToJson();
    } else {
      ws = Wallets.fromJson(walletsJson);
    }
  }

  @computed
  Wallet get wallet => ws.list[index];

  @computed
  CoinKey get currentCoinKey =>
      wallet.coinkeys.containsKey(parent.configStore.id)
          ? wallet.coinkeys[parent.configStore.id]
          : CoinKey();
}
