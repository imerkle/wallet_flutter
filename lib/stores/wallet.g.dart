// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

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

  final _$initPrepAsyncAction = AsyncAction('initPrep');

  @override
  Future<void> initPrep() {
    return _$initPrepAsyncAction.run(() => super.initPrep());
  }
}
