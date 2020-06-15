// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WalletStore on _WalletStore, Store {
  Computed<Wallet> _$walletComputed;

  @override
  Wallet get wallet =>
      (_$walletComputed ??= Computed<Wallet>(() => super.wallet)).value;
  Computed<CoinKey> _$currentCoinKeyComputed;

  @override
  CoinKey get currentCoinKey => (_$currentCoinKeyComputed ??=
          Computed<CoinKey>(() => super.currentCoinKey))
      .value;

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

  final _$indexAtom = Atom(name: '_WalletStore.index');

  @override
  int get index {
    _$indexAtom.context.enforceReadPolicy(_$indexAtom);
    _$indexAtom.reportObserved();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.context.conditionallyRunInAction(() {
      super.index = value;
      _$indexAtom.reportChanged();
    }, _$indexAtom, name: '${_$indexAtom.name}_set');
  }

  final _$initAsyncAction = AsyncAction('init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$addWalletAsyncAction = AsyncAction('addWallet');

  @override
  Future<void> addWallet() {
    return _$addWalletAsyncAction.run(() => super.addWallet());
  }
}
