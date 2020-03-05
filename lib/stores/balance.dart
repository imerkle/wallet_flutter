import 'dart:convert';
import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/gen/cargo/protos/coin.pb.dart';
import 'package:wallet_flutter/models/balance.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:http/http.dart' as http;

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
  @observable
  Map<String, dynamic> bl = {};
  Map<String, dynamic> prices = {};

  @observable
  Fiat fiat = Fiat(symbol: "\$", ticker: "usd");

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

  BalanceOut getBalance({String rel, String base}) {
    if (bl.containsKey(base) &&
        bl[base].containsKey(rel) &&
        prices.containsKey(rel)) {
      var x = bl[base][rel];
      double value = x["value"] / pow(10, precisions[rel]);
      return BalanceOut(value: value, price: prices[rel] ?? 0);
    }
    return BalanceOut(value: 0, price: 0);
  }
/*
  @action
  Future<void> refreshBalances(fiat) async {
    try {
      bl = await initFetchBalances(fiat);
    } catch (e) {}
  }

  Future<List<Balances>> initFetchBalances(fiat) async {
    List<Map<String, String>> bp = ws.list[walletIndex].coins.list.map((c) => {
          "api": explorerConfigList[c.rel].api,
          "kind": explorerConfigList[c.rel].kind,
          "rel": c.rel,
          "base": c.base,
          "address": c.address,
        });
    var response = await http.post(url,
        headers: headers,
        body: jsonEncode({
          "fiat": fiat.ticker,
          "list": bp,
        }));
    return (jsonDecode(response.body) as List)
        .map((e) => Balances.fromJson(e))
        .toList();
  }
*/
/*
  BalanceOutput getBalance({String rel, String base}) {
    if (bl.length == 0) {
      return BalanceOutput(balance: 0.0, fiat: 0.0);
    }
    var x = bl
        .singleWhere((b) => b.base == base)
        .balances
        .singleWhere((b) => b.rel == rel);
    var value = x.value / pow(10, precisions[rel]);
    return BalanceOutput(balance: value, fiat: x.fiat);
  }
  */
}
