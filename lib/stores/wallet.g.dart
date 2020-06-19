// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WalletStore on _WalletStore, Store {
  Computed<Wallet> _$walletComputed;

  @override
  Wallet get wallet => (_$walletComputed ??=
          Computed<Wallet>(() => super.wallet, name: '_WalletStore.wallet'))
      .value;
  Computed<CoinKey> _$currentCoinKeyComputed;

  @override
  CoinKey get currentCoinKey => (_$currentCoinKeyComputed ??= Computed<CoinKey>(
          () => super.currentCoinKey,
          name: '_WalletStore.currentCoinKey'))
      .value;

  final _$wsAtom = Atom(name: '_WalletStore.ws');

  @override
  Wallets get ws {
    _$wsAtom.reportRead();
    return super.ws;
  }

  @override
  set ws(Wallets value) {
    _$wsAtom.reportWrite(value, super.ws, () {
      super.ws = value;
    });
  }

  final _$indexAtom = Atom(name: '_WalletStore.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_WalletStore.init');

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$addWalletAsyncAction = AsyncAction('_WalletStore.addWallet');

  @override
  Future<void> addWallet() {
    return _$addWalletAsyncAction.run(() => super.addWallet());
  }

  @override
  String toString() {
    return '''
ws: ${ws},
index: ${index},
wallet: ${wallet},
currentCoinKey: ${currentCoinKey}
    ''';
  }
}
