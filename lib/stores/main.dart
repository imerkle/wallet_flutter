import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/gen/go-micro/services/chains/chain/chain.pb.dart';
import 'package:wallet_flutter/stores/balance.dart';
import 'package:wallet_flutter/stores/config.dart';
import '../models/rust.dart';

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
    /*
    balanceStore.fetchBalances(
        configStore.base,
        configStore.coins[configStore.base],
        walletStore.ws.list[walletStore.walletIndex].coins.list);
    balanceStore.fetchPrices(configStore.coins[configStore.base]);
    */
  }

  /*
  @computed
  Coins get coinListFromBase => walletStore
      .ws.list[walletStore.walletIndex].coinsList.list[fabStore.baseIndex];

  @computed
  Coin get coinFromRel => coinListFromBase.list[fabStore.relIndex];
*/

  @computed
  List<Transaction> get txs => transactionStore.getTransaction(configStore.id);
}
