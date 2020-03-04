// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BalanceStore on _BalanceStore, Store {
  final _$blAtom = Atom(name: '_BalanceStore.bl');

  @override
  Map<String, dynamic> get bl {
    _$blAtom.context.enforceReadPolicy(_$blAtom);
    _$blAtom.reportObserved();
    return super.bl;
  }

  @override
  set bl(Map<String, dynamic> value) {
    _$blAtom.context.conditionallyRunInAction(() {
      super.bl = value;
      _$blAtom.reportChanged();
    }, _$blAtom, name: '${_$blAtom.name}_set');
  }

  final _$fiatAtom = Atom(name: '_BalanceStore.fiat');

  @override
  Fiat get fiat {
    _$fiatAtom.context.enforceReadPolicy(_$fiatAtom);
    _$fiatAtom.reportObserved();
    return super.fiat;
  }

  @override
  set fiat(Fiat value) {
    _$fiatAtom.context.conditionallyRunInAction(() {
      super.fiat = value;
      _$fiatAtom.reportChanged();
    }, _$fiatAtom, name: '${_$fiatAtom.name}_set');
  }

  final _$fetchBalancesAsyncAction = AsyncAction('fetchBalances');

  @override
  Future<void> fetchBalances(
      String base, List<String> rels, List<Coin> coinList) {
    return _$fetchBalancesAsyncAction
        .run(() => super.fetchBalances(base, rels, coinList));
  }

  final _$fetchPricesAsyncAction = AsyncAction('fetchPrices');

  @override
  Future<void> fetchPrices(List<String> rels) {
    return _$fetchPricesAsyncAction.run(() => super.fetchPrices(rels));
  }
}
