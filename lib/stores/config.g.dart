// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfigStore on _ConfigStore, Store {
  final _$coinsAtom = Atom(name: '_ConfigStore.coins');

  @override
  Map<String, List<String>> get coins {
    _$coinsAtom.context.enforceReadPolicy(_$coinsAtom);
    _$coinsAtom.reportObserved();
    return super.coins;
  }

  @override
  set coins(Map<String, List<String>> value) {
    _$coinsAtom.context.conditionallyRunInAction(() {
      super.coins = value;
      _$coinsAtom.reportChanged();
    }, _$coinsAtom, name: '${_$coinsAtom.name}_set');
  }

  final _$baseAtom = Atom(name: '_ConfigStore.base');

  @override
  String get base {
    _$baseAtom.context.enforceReadPolicy(_$baseAtom);
    _$baseAtom.reportObserved();
    return super.base;
  }

  @override
  set base(String value) {
    _$baseAtom.context.conditionallyRunInAction(() {
      super.base = value;
      _$baseAtom.reportChanged();
    }, _$baseAtom, name: '${_$baseAtom.name}_set');
  }

  final _$relAtom = Atom(name: '_ConfigStore.rel');

  @override
  String get rel {
    _$relAtom.context.enforceReadPolicy(_$relAtom);
    _$relAtom.reportObserved();
    return super.rel;
  }

  @override
  set rel(String value) {
    _$relAtom.context.conditionallyRunInAction(() {
      super.rel = value;
      _$relAtom.reportChanged();
    }, _$relAtom, name: '${_$relAtom.name}_set');
  }

  final _$_ConfigStoreActionController = ActionController(name: '_ConfigStore');

  @override
  void init() {
    final _$actionInfo = _$_ConfigStoreActionController.startAction();
    try {
      return super.init();
    } finally {
      _$_ConfigStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRel(String s) {
    final _$actionInfo = _$_ConfigStoreActionController.startAction();
    try {
      return super.setRel(s);
    } finally {
      _$_ConfigStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBase(String s) {
    final _$actionInfo = _$_ConfigStoreActionController.startAction();
    try {
      return super.setBase(s);
    } finally {
      _$_ConfigStoreActionController.endAction(_$actionInfo);
    }
  }
}
