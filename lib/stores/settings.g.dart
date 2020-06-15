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
    _$settingsEnumAtom.context.enforceReadPolicy(_$settingsEnumAtom);
    _$settingsEnumAtom.reportObserved();
    return super.settingsEnum;
  }

  @override
  set settingsEnum(SettingsEnum value) {
    _$settingsEnumAtom.context.conditionallyRunInAction(() {
      super.settingsEnum = value;
      _$settingsEnumAtom.reportChanged();
    }, _$settingsEnumAtom, name: '${_$settingsEnumAtom.name}_set');
  }

  final _$_SettingsStoreActionController =
      ActionController(name: '_SettingsStore');

  @override
  void setSettingsEnum(SettingsEnum i) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction();
    try {
      return super.setSettingsEnum(i);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }
}
