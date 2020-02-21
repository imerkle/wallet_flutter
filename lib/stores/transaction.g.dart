// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionStore on _TransactionStore, Store {
  final _$txsAtom = Atom(name: '_TransactionStore.txs');

  @override
  Map<String, Map<String, List<Transaction>>> get txs {
    _$txsAtom.context.enforceReadPolicy(_$txsAtom);
    _$txsAtom.reportObserved();
    return super.txs;
  }

  @override
  set txs(Map<String, Map<String, List<Transaction>>> value) {
    _$txsAtom.context.conditionallyRunInAction(() {
      super.txs = value;
      _$txsAtom.reportChanged();
    }, _$txsAtom, name: '${_$txsAtom.name}_set');
  }

  final _$refreshTxsAsyncAction = AsyncAction('refreshTxs');

  @override
  Future<void> refreshTxs({String rel, String base, String address}) {
    return _$refreshTxsAsyncAction
        .run(() => super.refreshTxs(rel: rel, base: base, address: address));
  }
}
