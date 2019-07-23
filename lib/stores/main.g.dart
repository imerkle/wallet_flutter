// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$MainStore on _MainStore, Store {
  final _$wListAtom = Atom(name: '_MainStore.wList');

  @override
  List<Wallet> get wList {
    _$wListAtom.context.enforceReadPolicy(_$wListAtom);
    _$wListAtom.reportObserved();
    return super.wList;
  }

  @override
  set wList(List<Wallet> value) {
    _$wListAtom.context.conditionallyRunInAction(() {
      super.wList = value;
      _$wListAtom.reportChanged();
    }, _$wListAtom, name: '${_$wListAtom.name}_set');
  }
}
