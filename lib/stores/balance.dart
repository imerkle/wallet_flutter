import 'dart:collection';
import 'package:grpc/grpc.dart';
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/gen/chains/chain/chain.pb.dart';
import 'package:wallet_flutter/gen/chains/chain/chain.pbgrpc.dart';
import 'package:wallet_flutter/gen/pb/wallet.pb.dart';
import 'package:wallet_flutter/models/config.dart';
import 'package:fixnum/fixnum.dart';
import 'package:wallet_flutter/stores/main.dart';

// Include generated file
part 'balance.g.dart';

// This is the class used by rest of your codebase
class BalanceStore = _BalanceStore with _$BalanceStore;

abstract class _BalanceStore with Store {
  _BalanceStore({this.parent, this.chainServiceClient});
  final MainStore parent;
  final ChainServiceClient chainServiceClient;

  ObservableMap<String, GetBalanceResponse> balances = ObservableMap();
  ObservableMap<String, GetPriceResponse> prices = ObservableMap();

  @action
  Future<void> fetchBalance({ConfigAtom atom, CoinKey coinKey}) async {
    GetBalanceResponse res;
    try {
      res = await chainServiceClient.getBalance(GetBalanceRequest()
        ..api = atom.brurl
        ..address = coinKey.address
        ..kind = atom.brkind
        ..hash = atom.brhash
        ..precision = Int64(atom.precision));
      balances.update(atom.id, (value) => res, ifAbsent: () => res);
    } on GrpcError catch (e) {
      print("noo");
      parent.logStore.addGrpc(e);
    }
  }

  @action
  Future<void> fetchPrice({ConfigAtom atom}) async {
    GetPriceResponse res;
    try {
      res = await chainServiceClient.getPrice(GetPriceRequest()
        ..id = atom.id
        ..fiatTicker = parent.fiat.ticker);
      prices.update(atom.id, (value) => res, ifAbsent: () => res);
    } catch (e) {
      parent.logStore.addGrpc(e);
    }
  }

  @computed
  double get currentPrice => getPrice(parent.fabStore.configAtom);

  @computed
  BalanceNormalized get currentBalanceNormalized =>
      getBalanceNormalized(parent.fabStore.configAtom);

  BalanceNormalized getBalanceNormalized(ConfigAtom atom) {
    return balances.containsKey(atom.id)
        ? balances[atom.id].balanceNormalized
        : BalanceNormalized();
  }

  double getPrice(ConfigAtom atom) {
    return prices.containsKey(atom.id) ? prices[atom.id].price : 0.0;
  }
}
