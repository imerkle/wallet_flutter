import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:plugfox_localstorage/localstorage.dart';
import 'package:wallet_flutter/gen/chains/chain/chain.pbgrpc.dart';
import 'package:wallet_flutter/stores/log.dart';
import 'package:wallet_flutter/ui/folders/folder_store.dart';
import 'package:wallet_flutter/ui/homepage/homepage_store.dart';
import 'package:wallet_flutter/ui/settings/config.dart';
import 'package:wallet_flutter/ui/settings/settings_store.dart';
import 'package:wallet_flutter/ui/transaction/transaction_store.dart';
import 'package:wallet_flutter/ui/wallet/balance_store.dart';
import 'package:wallet_flutter/ui/wallet/wallet_store.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/utils/fn.dart';
import 'package:wallet_flutter/utils/rust.dart';

part 'main.g.dart';

class Fiat {
  Fiat({this.symbol, this.ticker});
  String symbol;
  String ticker;
}

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  _MainStore() {
    final chainServiceClient =
        ChainServiceClient(getGrpcClientChannel(CHAINS_API));
    this.transactionStore =
        TransactionStore(parent: this, chainServiceClient: chainServiceClient);
    this.balanceStore =
        BalanceStore(parent: this, chainServiceClient: chainServiceClient);
    this.walletStore = WalletStore(parent: this);
    this.folderStore = FolderStore(parent: this);
  }

  //TransactionStore transactionStore = TransactionStore();
  TransactionStore transactionStore;
  BalanceStore balanceStore;
  WalletStore walletStore;
  FolderStore folderStore;
  LogStore logStore = LogStore();
  ConfigStore configStore = ConfigStore();
  HomepageStore homepageStore = HomepageStore();
  SettingsStore settingsStore = SettingsStore();
  LocalStorage storage = LocalStorage();
  Rust rust = Rust();

  @observable
  Fiat fiat = Fiat(symbol: "\$", ticker: "usd");

  @action
  Future<void> initPrep() async {
    //rust.initChannel();
    await storage.init();
    await walletStore.init();
    /*
    balanceStore.fetchBalances(
        configStore.base,
        configStore.coins[configStore.base],
        walletStore.ws.list[walletStore.walletIndex].coins.list);
    balanceStore.fetchPrices(configStore.coins[configStore.base]);
    */
  }
}
