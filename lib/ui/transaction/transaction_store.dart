import 'dart:collection';

import 'package:grpc/grpc.dart';
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/gen/chains/chain/chain.pb.dart';
import 'package:wallet_flutter/gen/chains/chain/chain.pbgrpc.dart';
import 'package:wallet_flutter/gen/pb/config.pb.dart';
import 'package:wallet_flutter/gen/pb/transaction.pb.dart';
import 'package:wallet_flutter/gen/pb/wallet.pb.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:fixnum/fixnum.dart';

// Include generated file
part 'transaction_store.g.dart';

// This is the class used by rest of your codebase
class TransactionStore = _TransactionStore with _$TransactionStore;

abstract class _TransactionStore with Store {
  _TransactionStore({this.parent, this.chainServiceClient});
  final MainStore parent;
  final ChainServiceClient chainServiceClient;

  ObservableMap<String, List<Transaction>> txs = ObservableMap();

  @action
  Future<void> refreshTxs() async {
    Option option = parent.walletStore.option;
    String address = parent.walletStore.currentCoinKey.address;
    GetTransactionsResponse res;
    try {
      res = await chainServiceClient.getTransactions(GetTransactionsRequest()
        ..api = option.brurl
        ..address = address
        ..kind = option.brkind
        ..precision = Int64(option.precision));
      txs.update(option.id, (value) => res.transactions,
          ifAbsent: () => res.transactions);
    } on GrpcError catch (e) {
      parent.logStore.addGrpc(e);
    }
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
      ..value = Int64((amt * parent.walletStore.option.precision).toInt())
      ..memo = memo;
    o.address = receivingAddress;
    os.list.add(o);

    var txOpts = await getTransactionOpts(
        address: parent.walletStore.currentCoinKey.address);
    var input = GenSendTransactionRequest()
      ..config = parent.walletStore.option.config
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
      txs.containsKey(parent.folderStore.id) ? txs[parent.folderStore.id] : [];
}
