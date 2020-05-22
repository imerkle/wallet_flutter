import 'dart:collection';
import 'package:grpc/grpc.dart';
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/gen/chains/chain/chain.pb.dart';
import 'package:wallet_flutter/gen/chains/chain/chain.pbgrpc.dart';
import 'package:wallet_flutter/gen/wallet.pb.dart';
import 'package:wallet_flutter/models/config.dart';
import 'package:fixnum/fixnum.dart';
import 'package:wallet_flutter/stores/main.dart';

// Include generated file
part 'balance.g.dart';

// This is the class used by rest of your codebase
class BalanceStore = _BalanceStore with _$BalanceStore;

abstract class _BalanceStore with Store {
  _BalanceStore({this.parent, this.channel});
  final MainStore parent;
  final ClientChannel channel;

  @observable
  SplayTreeMap<String, GetBalanceResponse> balances = SplayTreeMap();
  SplayTreeMap<String, GetPriceResponse> prices = SplayTreeMap();

  @action
  Future<void> fetchBalance({ConfigAtom atom, CoinKey c}) async {
    final client = ChainServiceClient(channel);
    var res = await client.getBalance(GetBalanceRequest()
      ..api = atom.brurl
      ..address = c.address
      ..kind = atom.brkind
      ..hash = atom.brhash
      ..precision = Int64(atom.precision));
    balances.update(atom.id, (value) => res, ifAbsent: () => res);
  }

  @computed
  double get currentPrice => getPrice(parent.configStore.configAtom);
  @computed
  BalanceNormalized get currentBalanceNormalized =>
      getBalanceNormalized(parent.configStore.configAtom);

  BalanceNormalized getBalanceNormalized(ConfigAtom atom) {
    return balances.containsKey(atom.id)
        ? balances[atom.id].balanceNormalized
        : BalanceNormalized();
  }

  double getPrice(ConfigAtom atom) {
    return prices.containsKey(atom.id) ? prices[atom.id].price : 0.0;
  }
}
