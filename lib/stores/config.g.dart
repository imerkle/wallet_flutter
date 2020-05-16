// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfigStore on _ConfigStore, Store {
  Computed<ParentConfig> _$coinComputed;

  @override
  ParentConfig get coin =>
      (_$coinComputed ??= Computed<ParentConfig>(() => super.coin)).value;

  final _$configsAtom = Atom(name: '_ConfigStore.configs');

  @override
  List<ParentConfig> get configs {
    _$configsAtom.context.enforceReadPolicy(_$configsAtom);
    _$configsAtom.reportObserved();
    return super.configs;
  }

  @override
  set configs(List<ParentConfig> value) {
    _$configsAtom.context.conditionallyRunInAction(() {
      super.configs = value;
      _$configsAtom.reportChanged();
    }, _$configsAtom, name: '${_$configsAtom.name}_set');
  }

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

  final _$idAtom = Atom(name: '_ConfigStore.id');

  @override
  String get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$_ConfigStoreActionController = ActionController(name: '_ConfigStore');

  @override
  void setId(String s) {
    final _$actionInfo = _$_ConfigStoreActionController.startAction();
    try {
      return super.setId(s);
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
