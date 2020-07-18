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

  final _$configsAtom = Atom(name: '_ConfigStore.configs');

  @override
  ObservableMap<String, ConfigAtom> get configs {
    _$configsAtom.reportRead();
    return super.configs;
  }

  @override
  set configs(ObservableMap<String, ConfigAtom> value) {
    _$configsAtom.reportWrite(value, super.configs, () {
      super.configs = value;
    });
  }

  final _$_ConfigStoreActionController = ActionController(name: '_ConfigStore');

  @override
  dynamic setConfig(dynamic id, dynamic configAtom) {
    final _$actionInfo = _$_ConfigStoreActionController.startAction(
        name: '_ConfigStore.setConfig');
    try {
      return super.setConfig(id, configAtom);
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
configs: ${configs},
configsForWallet: ${configsForWallet}
    ''';
  }
}
