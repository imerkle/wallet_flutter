// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WalletStore on _WalletStore, Store {
  final _$wsAtom = Atom(name: '_WalletStore.ws');

  @override
  Wallets get ws {
    _$wsAtom.context.enforceReadPolicy(_$wsAtom);
    _$wsAtom.reportObserved();
    return super.ws;
  }

  @override
  set ws(Wallets value) {
    _$wsAtom.context.conditionallyRunInAction(() {
      super.ws = value;
      _$wsAtom.reportChanged();
    }, _$wsAtom, name: '${_$wsAtom.name}_set');
  }

  final _$walletIndexAtom = Atom(name: '_WalletStore.walletIndex');

  @override
  int get walletIndex {
    _$walletIndexAtom.context.enforceReadPolicy(_$walletIndexAtom);
    _$walletIndexAtom.reportObserved();
    return super.walletIndex;
  }

  @override
  set walletIndex(int value) {
    _$walletIndexAtom.context.conditionallyRunInAction(() {
      super.walletIndex = value;
      _$walletIndexAtom.reportChanged();
    }, _$walletIndexAtom, name: '${_$walletIndexAtom.name}_set');
  }

  final _$fiatAtom = Atom(name: '_WalletStore.fiat');

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

  final _$blAtom = Atom(name: '_WalletStore.bl');

  @override
  List<Balances> get bl {
    _$blAtom.context.enforceReadPolicy(_$blAtom);
    _$blAtom.reportObserved();
    return super.bl;
  }

  @override
  set bl(List<Balances> value) {
    _$blAtom.context.conditionallyRunInAction(() {
      super.bl = value;
      _$blAtom.reportChanged();
    }, _$blAtom, name: '${_$blAtom.name}_set');
  }

  final _$txsAtom = Atom(name: '_WalletStore.txs');

  @override
  List<Transaction> get txs {
    _$txsAtom.context.enforceReadPolicy(_$txsAtom);
    _$txsAtom.reportObserved();
    return super.txs;
  }

  @override
  set txs(List<Transaction> value) {
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

  final _$refreshBalancesAsyncAction = AsyncAction('refreshBalances');

  @override
  Future<void> refreshBalances() {
    return _$refreshBalancesAsyncAction.run(() => super.refreshBalances());
  }

  final _$initWalletIfAbsentAsyncAction = AsyncAction('initWalletIfAbsent');

  @override
  Future<void> initWalletIfAbsent(Rust rust) {
    return _$initWalletIfAbsentAsyncAction
        .run(() => super.initWalletIfAbsent(rust));
  }
}
