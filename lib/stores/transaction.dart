import 'dart:collection';

import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/gen/go-micro/services/chains/chain/chain.pb.dart';

// Include generated file
part 'transaction.g.dart';

// This is the class used by rest of your codebase
class TransactionStore = _TransactionStore with _$TransactionStore;

abstract class _TransactionStore with Store {
  HashMap<String, List<Transaction>> txs = HashMap();

  @action
  Future<void> refreshTxs({String id, String address}) async {
    /*
    try {
      var t = await getTransactions(rel: rel, base: base, address: address);
      if (!txs.containsKey(base)) {
        txs = {
          base: {rel: t}
        };
      } else if (!txs[base].containsKey(rel)) {
        txs[base] = {rel: t};
      } else {
        txs[base][rel] = t;
      }
    } catch (e) {
      print(e);
    }
  */
  }
  List<Transaction> getTransaction(String id) {
    return txs.containsKey(id) ? txs[id] : [];
  }
}
