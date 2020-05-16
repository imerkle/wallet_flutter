import 'dart:convert';
import 'dart:math';

import 'package:grpc/grpc.dart';
import 'package:mobx/mobx.dart' show Store, action, observable;
import 'package:wallet_flutter/gen/cargo/protos/coin.pb.dart';
import 'package:wallet_flutter/gen/go-micro/services/chains/chain/chain.pb.dart';
import 'package:wallet_flutter/gen/go-micro/services/chains/chain/chain.pbgrpc.dart';
import 'package:wallet_flutter/models/balance.dart';
import 'package:wallet_flutter/models/config.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:fixnum/fixnum.dart';

// Include generated file
part 'balance.g.dart';

class Fiat {
  Fiat({this.symbol, this.ticker});
  String symbol;
  String ticker;
}

class BalanceOut {
  double value;
  double price;
  BalanceOut({this.value, this.price});
}

const Map<String, String> HEADERS = {"Content-type": "application/json"};

// This is the class used by rest of your codebase
class BalanceStore = _BalanceStore with _$BalanceStore;

abstract class _BalanceStore with Store {
  final channel = ClientChannel('127.0.0.1', port: 50051);

  @observable
  Map<String, dynamic> bl = {};
  Map<String, dynamic> prices = {};

  @observable
  Fiat fiat = Fiat(symbol: "\$", ticker: "usd");

  fetchBalance(ConfigAtom atom, Coin c) {
    final client = ChainServiceClient(channel);
    client.getBalance(GetBalanceRequest()
      ..api = atom.brurl
      ..address = c.address
      ..kind = atom.brkind
      ..hash = atom.brhash
      ..precision = Int64(atom.precision));
  }

  @action
  Future<void> fetchBalances(
      String base, List<String> rels, List<Coin> coinList) async {
    if (!bl.containsKey(base)) {
      var response = await http.post('$explorerApi/get_balances',
          headers: HEADERS,
          body: jsonEncode({
            "fiat": fiat.ticker,
            "list": rels
                .map((rel) => {
                      "api": explorerConfigList[rel].api,
                      "kind": explorerConfigList[rel].kind,
                      "rel": rel,
                      "base": base,
                      "address": coinList
                          .firstWhere((x) => x.base == base && x.rel == rel)
                          .address
                    })
                .toList(),
          }));
      bl = {...bl, ...jsonDecode(response.body)};
    }
  }

  @action
  Future<void> fetchPrices(List<String> rels) async {
    if (!prices.containsKey(rels[0])) {
      var response = await http.post('$explorerApi/get_prices',
          headers: HEADERS,
          body: jsonEncode({
            "fiat": fiat.ticker,
            "list": rels,
          }));
      prices = {...prices, ...jsonDecode(response.body)};
    }
  }

  BalanceOut getBalance({ConfigAtom atom}) {
    if (bl.containsKey(atom.id) && prices.containsKey(atom.id)) {
      var x = bl[atom.id];
      double value = x["value"] / pow(10, atom.precision);
      return BalanceOut(value: value, price: prices[atom.id] ?? 0);
    }
    return BalanceOut(value: 0, price: 0);
  }
}
