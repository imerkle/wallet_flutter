// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SortStore on _SortStore, Store {
  final _$sortablesAtom = Atom(name: '_SortStore.sortables');

  @override
  ObservableList<Sortable> get sortables {
    _$sortablesAtom.reportRead();
    return super.sortables;
  }

  @override
  set sortables(ObservableList<Sortable> value) {
    _$sortablesAtom.reportWrite(value, super.sortables, () {
      super.sortables = value;
    });
  }

  final _$_SortStoreActionController = ActionController(name: '_SortStore');

  @override
  void activate(int index) {
    final _$actionInfo =
        _$_SortStoreActionController.startAction(name: '_SortStore.activate');
    try {
      return super.activate(index);
    } finally {
      _$_SortStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeDirection(int index) {
    final _$actionInfo = _$_SortStoreActionController.startAction(
        name: '_SortStore.changeDirection');
    try {
      return super.changeDirection(index);
    } finally {
      _$_SortStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sortables: ${sortables}
    ''';
  }
}
