import 'dart:async';

import 'package:mobx/mobx.dart';
import '../gen/cargo/protos/coin.pb.dart';
import '../models/rust.dart';
import '../models/transaction.dart';

import '../stores/sort.dart';
import '../stores/wallet.dart';
import '../stores/fab.dart';
import '../stores/transaction.dart';

part 'main.g.dart';

class MainStore = _MainStore with _$MainStore;

class Fiat {
  Fiat({this.symbol, this.ticker});
  String symbol;
  String ticker;
}

abstract class _MainStore with Store {
  FabStore fabStore = FabStore();
  SortStore sortStore = SortStore();
  WalletStore walletStore = WalletStore();
  TransactionStore transactionStore = TransactionStore();
  Rust rust = Rust();

  @observable
  Fiat fiat = Fiat(symbol: "\$", ticker: "usd");

  @action
  Future<void> initPrep() async {
    rust.initChannel();
    walletStore.initPrep(rust, fiat);
    sortStore.sortables.add(Sortable("Coin", true, true));
    sortStore.sortables.add(Sortable("Amount", false, true));
  }

  @computed
  Coins get coinListFromBase => walletStore
      .ws.list[walletStore.walletIndex].coinsList.list[fabStore.baseIndex];

  @computed
  Coin get coinFromRel => coinListFromBase.list[fabStore.relIndex];

  List<Transaction> get txs =>
      transactionStore.txs.containsKey(coinListFromBase.base) &&
              transactionStore.txs[coinListFromBase.base]
                  .containsKey(coinFromRel.rel)
          ? transactionStore.txs[coinListFromBase.base][coinFromRel.rel]
          : [];
}
