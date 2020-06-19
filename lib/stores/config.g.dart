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
  Map<String, ConfigAtom> get configs {
    _$configsAtom.reportRead();
    return super.configs;
  }

  @override
  set configs(Map<String, ConfigAtom> value) {
    _$configsAtom.reportWrite(value, super.configs, () {
      super.configs = value;
    });
  }

  @override
  String toString() {
    return '''
configs: ${configs},
configsForWallet: ${configsForWallet}
    ''';
  }
}
