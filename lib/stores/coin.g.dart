// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$CoinStore on _CoinStore, Store {
  final _$coinsAtom = Atom(name: '_CoinStore.coins');

  @override
  List<Coin> get coins {
    _$coinsAtom.reportObserved();
    return super.coins;
  }

  @override
  set coins(List<Coin> value) {
    _$coinsAtom.context.checkIfStateModificationsAreAllowed(_$coinsAtom);
    super.coins = value;
    _$coinsAtom.reportChanged();
  }

  final _$_CoinStoreActionController = ActionController(name: '_CoinStore');

  @override
  dynamic setCoins(List<Coin> c) {
    final _$actionInfo = _$_CoinStoreActionController.startAction();
    try {
      return super.setCoins(c);
    } finally {
      _$_CoinStoreActionController.endAction(_$actionInfo);
    }
  }
}
