// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BalanceStore on _BalanceStore, Store {
  Computed<double> _$currentPriceComputed;

  @override
  double get currentPrice =>
      (_$currentPriceComputed ??= Computed<double>(() => super.currentPrice,
              name: '_BalanceStore.currentPrice'))
          .value;
  Computed<BalanceNormalized> _$currentBalanceNormalizedComputed;

  @override
  BalanceNormalized get currentBalanceNormalized =>
      (_$currentBalanceNormalizedComputed ??= Computed<BalanceNormalized>(
              () => super.currentBalanceNormalized,
              name: '_BalanceStore.currentBalanceNormalized'))
          .value;

  final _$fetchBalanceAsyncAction = AsyncAction('_BalanceStore.fetchBalance');

  @override
  Future<void> fetchBalance({ConfigAtom atom, CoinKey coinKey}) {
    return _$fetchBalanceAsyncAction
        .run(() => super.fetchBalance(atom: atom, coinKey: coinKey));
  }

  final _$fetchPriceAsyncAction = AsyncAction('_BalanceStore.fetchPrice');

  @override
  Future<void> fetchPrice({ConfigAtom atom}) {
    return _$fetchPriceAsyncAction.run(() => super.fetchPrice(atom: atom));
  }

  @override
  String toString() {
    return '''
currentPrice: ${currentPrice},
currentBalanceNormalized: ${currentBalanceNormalized}
    ''';
  }
}
