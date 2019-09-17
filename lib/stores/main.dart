import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/gen/cargo/protos/coin.pb.dart';

import 'package:wallet_flutter/stores/sort.dart';
import 'package:wallet_flutter/stores/wallet.dart';

import 'fab.dart';
part 'main.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore with Store {

  FabStore fabStore = new FabStore();
  SortStore sortStore = new SortStore();
  WalletStore walletStore = new WalletStore();
  

  @action
  Future<void> initPrep() async{
    sortStore.sortables.add(Sortable("Coin", true, true));
    sortStore.sortables.add(Sortable("Amount", false, true));
    if (Platform.isAndroid || Platform.isIOS){
      walletStore.initPrep();
    }
  }

  @computed
  Coins get coinListFromBase =>  walletStore.ws.list[walletStore.walletIndex].coinsList.list[fabStore.baseIndex];

  @computed 
  Coin get coinFromRel => coinListFromBase.list[fabStore.relIndex];
}