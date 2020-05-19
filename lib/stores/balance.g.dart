// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BalanceStore on _BalanceStore, Store {
  final _$balancesAtom = Atom(name: '_BalanceStore.balances');

  @override
  SplayTreeMap<String, GetBalanceResponse> get balances {
    _$balancesAtom.context.enforceReadPolicy(_$balancesAtom);
    _$balancesAtom.reportObserved();
    return super.balances;
  }

  @override
  set balances(SplayTreeMap<String, GetBalanceResponse> value) {
    _$balancesAtom.context.conditionallyRunInAction(() {
      super.balances = value;
      _$balancesAtom.reportChanged();
    }, _$balancesAtom, name: '${_$balancesAtom.name}_set');
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

  final _$fetchBalanceAsyncAction = AsyncAction('fetchBalance');

  @override
  Future fetchBalance(ConfigAtom atom, CoinKey c) {
    return _$fetchBalanceAsyncAction.run(() => super.fetchBalance(atom, c));
  }
}
