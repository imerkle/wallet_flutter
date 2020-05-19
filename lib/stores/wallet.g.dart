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

  final _$initWalletIfAbsentAsyncAction = AsyncAction('initWalletIfAbsent');

  @override
  Future<void> initWalletIfAbsent(Map<String, ConfigAtom> configs, Rust rust) {
    return _$initWalletIfAbsentAsyncAction
        .run(() => super.initWalletIfAbsent(configs, rust));
  }
}
