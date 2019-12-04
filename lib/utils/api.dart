import 'dart:convert';
import 'package:http/http.dart' as http;
import '../gen/cargo/protos/coin.pb.dart';
import '../models/transaction.dart';

import 'constants.dart';

Future<dynamic> getTransactions(
    {String rel, String base, String address}) async {
  var response = await http.get(
      "$explorerApi/get_txs?api=${explorerConfigList[rel].api}&rel=$rel&base=$base&address=$address",
      headers: {"Content-type": "application/json"});
  print(response.body);
  List txs = json.decode(response.body);
  txs = txs.map((t) => {Transaction.fromJson(t)}).toList();
  return txs;
}

Future<dynamic> getTransactionOpts(
    {String rel, String base, String address}) async {
  var response = await http.post("$explorerApi/get_txopts",
      headers: {"Content-type": "application/json"},
      body: jsonEncode({
        "api": explorerConfigList[rel].api,
        "rel": rel,
        "base": base,
        "address": address,
      }));
  TxOpts txOpts = TxOpts().createEmptyInstance();
  txOpts.mergeFromProto3Json(json.decode(response.body));
  return txOpts;
}

Future<String> sendTransaction({String rel, String base, String rawTx}) async {
  var response = await http.post("$explorerApi/send_tx",
      headers: {"Content-type": "application/json"},
      body: jsonEncode(
          {"api": explorerConfigList[rel].api, "base": base, "rawTx": rawTx}));
  print('Response body: ${response.body}');
  return response.body;
}
