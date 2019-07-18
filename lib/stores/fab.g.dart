// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fab.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$FabStore on _FabStore, Store {
  final _$selectedAtom = Atom(name: '_FabStore.selected');

  @override
  int get selected {
    _$selectedAtom.context.enforceReadPolicy(_$selectedAtom);
    _$selectedAtom.reportObserved();
    return super.selected;
  }

  @override
  set selected(int value) {
    _$selectedAtom.context.conditionallyRunInAction(() {
      super.selected = value;
      _$selectedAtom.reportChanged();
    }, _$selectedAtom, name: '${_$selectedAtom.name}_set');
  }

  final _$selectedChildAtom = Atom(name: '_FabStore.selectedChild');

  @override
  int get selectedChild {
    _$selectedChildAtom.context.enforceReadPolicy(_$selectedChildAtom);
    _$selectedChildAtom.reportObserved();
    return super.selectedChild;
  }

  @override
  set selectedChild(int value) {
    _$selectedChildAtom.context.conditionallyRunInAction(() {
      super.selectedChild = value;
      _$selectedChildAtom.reportChanged();
    }, _$selectedChildAtom, name: '${_$selectedChildAtom.name}_set');
  }

  final _$_FabStoreActionController = ActionController(name: '_FabStore');

  @override
  void setSelected(int c) {
    final _$actionInfo = _$_FabStoreActionController.startAction();
    try {
      return super.setSelected(c);
    } finally {
      _$_FabStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedChild(int c) {
    final _$actionInfo = _$_FabStoreActionController.startAction();
    try {
      return super.setSelectedChild(c);
    } finally {
      _$_FabStoreActionController.endAction(_$actionInfo);
    }
  }
}
