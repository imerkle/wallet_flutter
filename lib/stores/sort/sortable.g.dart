// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sortable.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Sortable on _Sortable, Store {
  final _$activeAtom = Atom(name: '_Sortable.active');

  @override
  bool get active {
    _$activeAtom.reportRead();
    return super.active;
  }

  @override
  set active(bool value) {
    _$activeAtom.reportWrite(value, super.active, () {
      super.active = value;
    });
  }

  final _$directionAtom = Atom(name: '_Sortable.direction');

  @override
  SortDirection get direction {
    _$directionAtom.reportRead();
    return super.direction;
  }

  @override
  set direction(SortDirection value) {
    _$directionAtom.reportWrite(value, super.direction, () {
      super.direction = value;
    });
  }

  final _$_SortableActionController = ActionController(name: '_Sortable');

  @override
  void toggleDirection() {
    final _$actionInfo = _$_SortableActionController.startAction(
        name: '_Sortable.toggleDirection');
    try {
      return super.toggleDirection();
    } finally {
      _$_SortableActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
active: ${active},
direction: ${direction}
    ''';
  }
}
