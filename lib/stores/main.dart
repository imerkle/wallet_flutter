import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:plugfox_localstorage/localstorage.dart';
import 'package:wallet_flutter/gen/chains/chain/chain.pbgrpc.dart';
import 'package:wallet_flutter/stores/balance.dart';
import 'package:wallet_flutter/stores/config.dart';
import 'package:wallet_flutter/stores/homepage.dart';
import 'package:wallet_flutter/stores/log.dart';
import 'package:wallet_flutter/stores/settings.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/utils/fn.dart';
import 'package:wallet_flutter/utils/rust.dart';

import '../stores/sort.dart';
import '../stores/wallet.dart';
import '../stores/transaction.dart';

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
  }

  //TransactionStore transactionStore = TransactionStore();
  TransactionStore transactionStore;
  BalanceStore balanceStore;
  WalletStore walletStore;
  LogStore logStore = LogStore();
  SortStore sortStore = SortStore();
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
    sortStore.sortables.add(Sortable("Coin", true, true));
    sortStore.sortables.add(Sortable("Amount", false, true));
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
