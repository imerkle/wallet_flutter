import 'dart:collection';

import 'package:grpc/grpc.dart';
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/gen/chains/chain/chain.pb.dart';
import 'package:wallet_flutter/gen/transaction.pb.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:fixnum/fixnum.dart';

// Include generated file
part 'transaction.g.dart';

// This is the class used by rest of your codebase
class TransactionStore = _TransactionStore with _$TransactionStore;

abstract class _TransactionStore with Store {
  _TransactionStore({this.parent, this.channel});
  final MainStore parent;
  final ClientChannel channel;

  HashMap<String, List<Transaction>> txs = HashMap();

  @action
  Future<void> refreshTxs() async {
    String id = parent.configStore.id;
    String address = parent.walletStore.currentCoinKey.address;

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

  Future<String> sendTx(
      {double amount,
      bool amountInFiat,
      String receivingAddress,
      String memo = ""}) async {
    var amt = amountInFiat ? amount / parent.balanceStore.currentPrice : amount;
    Outputs os = Outputs();
    Output o = Output()
      ..address = receivingAddress
      ..value = Int64((amt * parent.configStore.configAtom.precision).toInt())
      ..memo = memo;
    o.address = receivingAddress;
    os.list.add(o);

    var txOpts = await getTransactionOpts(
        address: parent.walletStore.currentCoinKey.address);
    var input = GenSendTransactionRequest()
      ..config = parent.configStore.configAtom.config
      ..privateKey = parent.walletStore.currentCoinKey.privateKey
      ..publicKey = parent.walletStore.currentCoinKey.publicKey
      ..outputs = os
      ..txOpts = txOpts;

    var res = await parent.rust
        .invokeRustMethod('gen_send_transaction', input.writeToBuffer());
    var t = Tx.fromBuffer(res);
    String txHex = await broadCastRawTx(rawTx: t.txHex);
    return txHex;
  }

  Future<String> broadCastRawTx({String rawTx}) {
    UnimplementedError;
  }

  Future<TxOpts> getTransactionOpts({String address}) async {
    UnimplementedError;
  }

  @computed
  List<Transaction> get currentTxs =>
      txs.containsKey(parent.configStore.id) ? txs[parent.configStore.id] : [];
}
