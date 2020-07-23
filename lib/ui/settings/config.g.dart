// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConfigStore on _ConfigStore, Store {
  Computed<Iterable<Config>> _$configsForWalletComputed;

  @override
  Iterable<Config> get configsForWallet => (_$configsForWalletComputed ??=
          Computed<Iterable<Config>>(() => super.configsForWallet,
              name: '_ConfigStore.configsForWallet'))
      .value;

  final _$optionsAtom = Atom(name: '_ConfigStore.options');

  @override
  ObservableMap<String, Option> get options {
    _$optionsAtom.reportRead();
    return super.options;
  }

  @override
  set options(ObservableMap<String, Option> value) {
    _$optionsAtom.reportWrite(value, super.options, () {
      super.options = value;
    });
  }

  final _$_ConfigStoreActionController = ActionController(name: '_ConfigStore');

  @override
  dynamic setConfig(dynamic id, dynamic option) {
    final _$actionInfo = _$_ConfigStoreActionController.startAction(
        name: '_ConfigStore.setConfig');
    try {
      return super.setConfig(id, option);
    } finally {
      _$_ConfigStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeConfig(String key) {
    final _$actionInfo = _$_ConfigStoreActionController.startAction(
        name: '_ConfigStore.removeConfig');
    try {
      return super.removeConfig(key);
    } finally {
      _$_ConfigStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
options: ${options},
configsForWallet: ${configsForWallet}
    ''';
  }
}
