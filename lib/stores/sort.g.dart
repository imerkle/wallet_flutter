// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sort.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$SortStore on _SortStore, Store {
  final _$sortablesAtom = Atom(name: '_SortStore.sortables');

  @override
  List<Sortable> get sortables {
    _$sortablesAtom.context.enforceReadPolicy(_$sortablesAtom);
    _$sortablesAtom.reportObserved();
    return super.sortables;
  }

  @override
  set sortables(List<Sortable> value) {
    _$sortablesAtom.context.conditionallyRunInAction(() {
      super.sortables = value;
      _$sortablesAtom.reportChanged();
    }, _$sortablesAtom, name: '${_$sortablesAtom.name}_set');
  }

  final _$_SortStoreActionController = ActionController(name: '_SortStore');

  @override
  dynamic activate(int index) {
    final _$actionInfo = _$_SortStoreActionController.startAction();
    try {
      return super.activate(index);
    } finally {
      _$_SortStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDirection(int index) {
    final _$actionInfo = _$_SortStoreActionController.startAction();
    try {
      return super.changeDirection(index);
    } finally {
      _$_SortStoreActionController.endAction(_$actionInfo);
    }
  }
}
