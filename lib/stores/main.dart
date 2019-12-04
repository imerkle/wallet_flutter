import 'dart:async';

import 'package:mobx/mobx.dart';
import '../gen/cargo/protos/coin.pb.dart';
import '../models/rust.dart';

import '../stores/sort.dart';
import '../stores/wallet.dart';
import '../stores/fab.dart';

part 'main.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {
  FabStore fabStore = FabStore();
  SortStore sortStore = SortStore();
  WalletStore walletStore = WalletStore();
  Rust rust = Rust();

  @action
  Future<void> initPrep() async {
    rust.initChannel();
    walletStore.initPrep(rust);
    sortStore.sortables.add(Sortable("Coin", true, true));
    sortStore.sortables.add(Sortable("Amount", false, true));
  }

  @computed
  Coins get coinListFromBase => walletStore
      .ws.list[walletStore.walletIndex].coinsList.list[fabStore.baseIndex];

  @computed
  Coin get coinFromRel => coinListFromBase.list[fabStore.relIndex];
}
