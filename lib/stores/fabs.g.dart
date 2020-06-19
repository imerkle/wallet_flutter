// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fabs.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FabsStore on _FabsStore, Store {
  Computed<String> _$idComputed;

  @override
  String get id =>
      (_$idComputed ??= Computed<String>(() => super.id, name: '_FabsStore.id'))
          .value;
  Computed<ConfigAtom> _$configAtomComputed;

  @override
  ConfigAtom get configAtom =>
      (_$configAtomComputed ??= Computed<ConfigAtom>(() => super.configAtom,
              name: '_FabsStore.configAtom'))
          .value;
  Computed<List<String>> _$idsComputed;

  @override
  List<String> get ids => (_$idsComputed ??=
          Computed<List<String>>(() => super.ids, name: '_FabsStore.ids'))
      .value;
  Computed<String> _$baseNameComputed;

  @override
  String get baseName => (_$baseNameComputed ??=
          Computed<String>(() => super.baseName, name: '_FabsStore.baseName'))
      .value;

  final _$baseAtom = Atom(name: '_FabsStore.base');

  @override
  String get base {
    _$baseAtom.reportRead();
    return super.base;
  }

  @override
  set base(String value) {
    _$baseAtom.reportWrite(value, super.base, () {
      super.base = value;
    });
  }

  final _$coinPairsAtom = Atom(name: '_FabsStore.coinPairs');

  @override
  Map<String, List<String>> get coinPairs {
    _$coinPairsAtom.reportRead();
    return super.coinPairs;
  }

  @override
  set coinPairs(Map<String, List<String>> value) {
    _$coinPairsAtom.reportWrite(value, super.coinPairs, () {
      super.coinPairs = value;
    });
  }

  final _$_FabsStoreActionController = ActionController(name: '_FabsStore');

  @override
  void setId(String s) {
    final _$actionInfo =
        _$_FabsStoreActionController.startAction(name: '_FabsStore.setId');
    try {
      return super.setId(s);
    } finally {
      _$_FabsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
base: ${base},
coinPairs: ${coinPairs},
id: ${id},
configAtom: ${configAtom},
ids: ${ids},
baseName: ${baseName}
    ''';
  }
}
