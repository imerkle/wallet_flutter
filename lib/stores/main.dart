import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/gen/chains/chain/chain.pbgrpc.dart';
import 'package:wallet_flutter/stores/balance.dart';
import 'package:wallet_flutter/stores/config.dart';
import 'package:wallet_flutter/stores/log.dart';
import 'package:wallet_flutter/utils/constants.dart';
import '../models/rust.dart';

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
    final chainServiceClient = ChainServiceClient(ClientChannel(CHAINS_API.host,
        port: CHAINS_API.port,
        options: ChannelOptions(credentials: ChannelCredentials.insecure())));
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
  Rust rust = Rust();

  @observable
  Fiat fiat = Fiat(symbol: "\$", ticker: "usd");

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
}
