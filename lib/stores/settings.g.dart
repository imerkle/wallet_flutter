// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStore, Store {
  final _$settingsEnumAtom = Atom(name: '_SettingsStore.settingsEnum');

  @override
  SettingsEnum get settingsEnum {
    _$settingsEnumAtom.reportRead();
    return super.settingsEnum;
  }

  @override
  set settingsEnum(SettingsEnum value) {
    _$settingsEnumAtom.reportWrite(value, super.settingsEnum, () {
      super.settingsEnum = value;
    });
  }

  final _$_SettingsStoreActionController =
      ActionController(name: '_SettingsStore');

  @override
  void setSettingsEnum(SettingsEnum i) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.setSettingsEnum');
    try {
      return super.setSettingsEnum(i);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
settingsEnum: ${settingsEnum}
    ''';
  }
}
