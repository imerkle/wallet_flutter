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
    _$selectedAtom.reportObserved();
    return super.selected;
  }

  @override
  set selected(int value) {
    _$selectedAtom.context.checkIfStateModificationsAreAllowed(_$selectedAtom);
    super.selected = value;
    _$selectedAtom.reportChanged();
  }

  final _$_FabStoreActionController = ActionController(name: '_FabStore');

  @override
  dynamic setSelected(int c) {
    final _$actionInfo = _$_FabStoreActionController.startAction();
    try {
      return super.setSelected(c);
    } finally {
      _$_FabStoreActionController.endAction(_$actionInfo);
    }
  }
}
