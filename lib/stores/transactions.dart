import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/models/transaction.dart';

part 'transaction.g.dart';

class TransactionStore = _TransactionStore with _$TransactionStore;

abstract class _TransactionStore with Store {
  @observable
  List<Transaction> txs;
  Future<Void> getTxs() async {}
}
