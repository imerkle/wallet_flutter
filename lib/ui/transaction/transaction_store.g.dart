// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionStore on _TransactionStore, Store {
  Computed<List<Transaction>> _$currentTxsComputed;

  @override
  List<Transaction> get currentTxs => (_$currentTxsComputed ??=
          Computed<List<Transaction>>(() => super.currentTxs,
              name: '_TransactionStore.currentTxs'))
      .value;

  final _$refreshTxsAsyncAction = AsyncAction('_TransactionStore.refreshTxs');

  @override
  Future<void> refreshTxs() {
    return _$refreshTxsAsyncAction.run(() => super.refreshTxs());
  }

  @override
  String toString() {
    return '''
currentTxs: ${currentTxs}
    ''';
  }
}
