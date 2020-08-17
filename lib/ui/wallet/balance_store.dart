import 'dart:collection';
import 'package:grpc/grpc.dart';
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/gen/chains/chain/chain.pb.dart';
import 'package:wallet_flutter/gen/chains/chain/chain.pbgrpc.dart';
import 'package:wallet_flutter/gen/pb/config.pb.dart';
import 'package:wallet_flutter/gen/pb/wallet.pb.dart';
import 'package:fixnum/fixnum.dart';
import 'package:wallet_flutter/stores/main.dart';

// Include generated file
part 'balance_store.g.dart';

// This is the class used by rest of your codebase
class BalanceStore = _BalanceStore with _$BalanceStore;

abstract class _BalanceStore with Store {
  _BalanceStore({this.parent, this.chainServiceClient});
  final MainStore parent;
  final ChainServiceClient chainServiceClient;

  ObservableMap<String, GetBalanceResponse> balances = ObservableMap();
  ObservableMap<String, GetPriceResponse> prices = ObservableMap();

  @action
  Future<void> fetchBalance({Option option, CoinKey coinKey}) async {
    GetBalanceResponse res;
    try {
      res = await chainServiceClient.getBalance(GetBalanceRequest()
        ..api = option.brurl
        ..address = coinKey.address
        ..kind = option.brkind
        ..hash = option.brhash
        ..precision = Int64(option.precision));
      balances.update(option.id, (value) => res, ifAbsent: () => res);
    } on GrpcError catch (e) {
      print("noo");
      parent.logStore.addGrpc(e);
    }
  }

  @action
  Future<void> fetchPrice({Option option}) async {
    GetPriceResponse res;
    try {
      res = await chainServiceClient.getPrice(GetPriceRequest()
        ..id = option.id
        ..fiatTicker = parent.fiat.ticker);
      prices.update(option.id, (value) => res, ifAbsent: () => res);
    } catch (e) {
      parent.logStore.addGrpc(e);
    }
  }

  @computed
  double get currentPrice => getPrice(parent.walletStore.option);

  @computed
  BalanceNormalized get currentBalanceNormalized =>
      getBalanceNormalized(parent.walletStore.option);

  BalanceNormalized getBalanceNormalized(Option option) {
    return balances.containsKey(option.id)
        ? balances[option.id].balanceNormalized
        : BalanceNormalized();
  }

  double getPrice(Option option) {
    return prices.containsKey(option.id) ? prices[option.id].price : 0.0;
  }
}
