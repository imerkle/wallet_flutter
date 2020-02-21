import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/gen/cargo/protos/coin.pb.dart';
import 'package:wallet_flutter/models/transaction.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/utils/api.dart';

// Include generated file
part 'transaction.g.dart';

// This is the class used by rest of your codebase
class TransactionStore = _TransactionStore with _$TransactionStore;

abstract class _TransactionStore with Store {
  @observable
  Map<String, Map<String, List<Transaction>>> txs = {};

  @action
  Future<void> refreshTxs({String rel, String base, String address}) async {
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
  }
}
