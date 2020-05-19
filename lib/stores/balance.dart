import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:grpc/grpc.dart';
import 'package:mobx/mobx.dart' show Store, action, observable;
import 'package:wallet_flutter/gen/go-micro/services/chains/chain/chain.pb.dart';
import 'package:wallet_flutter/gen/go-micro/services/chains/chain/chain.pbgrpc.dart';
import 'package:wallet_flutter/gen/wallet.pb.dart';
import 'package:wallet_flutter/models/config.dart';
import 'package:fixnum/fixnum.dart';

// Include generated file
part 'balance.g.dart';

class Fiat {
  Fiat({this.symbol, this.ticker});
  String symbol;
  String ticker;
}

// This is the class used by rest of your codebase
class BalanceStore = _BalanceStore with _$BalanceStore;

abstract class _BalanceStore with Store {
  final channel = ClientChannel('127.0.0.1', port: 50051);

  @observable
  SplayTreeMap<String, GetBalanceResponse> balances = SplayTreeMap();
  SplayTreeMap<String, GetPriceResponse> prices = SplayTreeMap();

  @observable
  Fiat fiat = Fiat(symbol: "\$", ticker: "usd");

  @action
  fetchBalance(ConfigAtom atom, CoinKey c) async {
    final client = ChainServiceClient(channel);
    var res = await client.getBalance(GetBalanceRequest()
      ..api = atom.brurl
      ..address = c.address
      ..kind = atom.brkind
      ..hash = atom.brhash
      ..precision = Int64(atom.precision));
    balances.update(atom.id, (value) => res, ifAbsent: () => res);
  }

  BalanceNormalized getBalanceNormalized(ConfigAtom atom) {
    return balances.containsKey(atom.id)
        ? balances[atom.id].balanceNormalized
        : BalanceNormalized();
  }

  double getPrice(ConfigAtom atom) {
    return prices.containsKey(atom.id) ? prices[atom.id].price : 0.0;
  }
}
