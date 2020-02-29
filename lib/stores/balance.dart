import 'dart:convert';
import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/models/balance.dart';
import 'package:wallet_flutter/stores/wallet.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:http/http.dart' as http;

// Include generated file
part 'balance.g.dart';

class Fiat {
  Fiat({this.symbol, this.ticker});
  String symbol;
  String ticker;
}

const URL = '$explorerApi/get_balances';
const Map<String, String> HEADERS = {"Content-type": "application/json"};

// This is the class used by rest of your codebase
class BalanceStore = _BalanceStore with _$BalanceStore;

abstract class _BalanceStore with Store {
  @observable
  List<Balances> bl = [];

  @observable
  Fiat fiat = Fiat(symbol: "\$", ticker: "usd");

  @action
  Future<void> fetchBalances(
      String base, List<String> rels, WalletStore walletStore) async {
    var response = await http.post(URL,
        headers: HEADERS,
        body: jsonEncode({
          "fiat": fiat.ticker,
          "list": rels
              .map((rel) => {
                    "api": explorerConfigList[rel].api,
                    "kind": explorerConfigList[rel].kind,
                    "rel": rel,
                    "base": base,
                    "address": walletStore
                        .ws.list[walletStore.walletIndex].coins.list
                        .firstWhere((x) => x.base == base && x.rel == rel)
                  })
              .toList(),
        }));
    bl = (jsonDecode(response.body) as List)
        .map((e) => Balances.fromJson(e))
        .toList();
  }

  Balance getBalance({String rel, String base}) {
    if (bl.length == 0) {
      return Balance(value: 0.0, price: 0.0, rel: rel);
    }
    var x = bl
        .singleWhere((b) => b.base == base)
        .balances
        .singleWhere((b) => b.rel == rel);
    var value = x.value / pow(10, precisions[rel]);
    return Balance(value: value, price: x.price, rel: rel);
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
