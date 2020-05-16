import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/stores/balance.dart';
import 'package:wallet_flutter/stores/config.dart';
import '../gen/cargo/protos/coin.pb.dart';
import '../models/rust.dart';
import '../models/transaction.dart';

import '../stores/sort.dart';
import '../stores/wallet.dart';
import '../stores/transaction.dart';

part 'main.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  SortStore sortStore = SortStore();
  WalletStore walletStore = WalletStore();
  TransactionStore transactionStore = TransactionStore();
  ConfigStore configStore = ConfigStore();
  BalanceStore balanceStore = BalanceStore();
  Rust rust = Rust();

  @action
  Future<void> initPrep() async {
    rust.initChannel();
    sortStore.sortables.add(Sortable("Coin", true, true));
    sortStore.sortables.add(Sortable("Amount", false, true));
    await walletStore.initPrep(configStore.configs, rust);
    balanceStore.fetchBalances(
        configStore.base,
        configStore.coins[configStore.base],
        walletStore.ws.list[walletStore.walletIndex].coins.list);
    balanceStore.fetchPrices(configStore.coins[configStore.base]);
  }

  @computed
  Coin get coin => walletStore.ws.list[walletStore.walletIndex].coins.list
      .firstWhere((x) => x.base == configStore.base && x.rel == configStore.id,
          orElse: () => Coin());

  /*
  @computed
  Coins get coinListFromBase => walletStore
      .ws.list[walletStore.walletIndex].coinsList.list[fabStore.baseIndex];

  @computed
  Coin get coinFromRel => coinListFromBase.list[fabStore.relIndex];
*/

/*
  List<Transaction> get txs => transactionStore.txs
              .containsKey(configStore.base) &&
          transactionStore.txs[configStore.base].containsKey(configStore.id)
      ? transactionStore.txs[configStore.base][configStore.id]
      : [];
      */
}
