// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelectStore<T> on _SelectStore<T>, Store {
  Computed<T> _$valueComputed;

  @override
  T get value => (_$valueComputed ??=
          Computed<T>(() => super.value, name: '_SelectStore.value'))
      .value;

  final _$valuesAtom = Atom(name: '_SelectStore.values');

  @override
  ObservableList<T> get values {
    _$valuesAtom.reportRead();
    return super.values;
  }

  @override
  set values(ObservableList<T> value) {
    _$valuesAtom.reportWrite(value, super.values, () {
      super.values = value;
    });
  }

  final _$indexAtom = Atom(name: '_SelectStore.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$_SelectStoreActionController = ActionController(name: '_SelectStore');

  @override
  dynamic setIndex(int i) {
    final _$actionInfo = _$_SelectStoreActionController.startAction(
        name: '_SelectStore.setIndex');
    try {
      return super.setIndex(i);
    } finally {
      _$_SelectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
values: ${values},
index: ${index},
value: ${value}
    ''';
  }
}
