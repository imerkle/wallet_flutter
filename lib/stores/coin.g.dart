// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$CoinStore on _CoinStore, Store {
  final _$coinbaseAtom = Atom(name: '_CoinStore.coinbase');

  @override
  List<CoinBase> get coinbase {
    _$coinbaseAtom.context.enforceReadPolicy(_$coinbaseAtom);
    _$coinbaseAtom.reportObserved();
    return super.coinbase;
  }

  @override
  set coinbase(List<CoinBase> value) {
    _$coinbaseAtom.context.conditionallyRunInAction(() {
      super.coinbase = value;
      _$coinbaseAtom.reportChanged();
    }, _$coinbaseAtom, name: '${_$coinbaseAtom.name}_set');
  }
}
