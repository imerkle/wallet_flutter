// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fab.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$FabStore on _FabStore, Store {
  final _$baseIndexAtom = Atom(name: '_FabStore.baseIndex');

  @override
  int get baseIndex {
    _$baseIndexAtom.context.enforceReadPolicy(_$baseIndexAtom);
    _$baseIndexAtom.reportObserved();
    return super.baseIndex;
  }

  @override
  set baseIndex(int value) {
    _$baseIndexAtom.context.conditionallyRunInAction(() {
      super.baseIndex = value;
      _$baseIndexAtom.reportChanged();
    }, _$baseIndexAtom, name: '${_$baseIndexAtom.name}_set');
  }

  final _$relIndexAtom = Atom(name: '_FabStore.relIndex');

  @override
  int get relIndex {
    _$relIndexAtom.context.enforceReadPolicy(_$relIndexAtom);
    _$relIndexAtom.reportObserved();
    return super.relIndex;
  }

  @override
  set relIndex(int value) {
    _$relIndexAtom.context.conditionallyRunInAction(() {
      super.relIndex = value;
      _$relIndexAtom.reportChanged();
    }, _$relIndexAtom, name: '${_$relIndexAtom.name}_set');
  }

  final _$_FabStoreActionController = ActionController(name: '_FabStore');

  @override
  void setBaseIndex(int c) {
    final _$actionInfo = _$_FabStoreActionController.startAction();
    try {
      return super.setBaseIndex(c);
    } finally {
      _$_FabStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRelIndex(int c) {
    final _$actionInfo = _$_FabStoreActionController.startAction();
    try {
      return super.setRelIndex(c);
    } finally {
      _$_FabStoreActionController.endAction(_$actionInfo);
    }
  }
}
