// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homepage.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomepageStore on _HomepageStore, Store {
  final _$pageIndexAtom = Atom(name: '_HomepageStore.pageIndex');

  @override
  int get pageIndex {
    _$pageIndexAtom.context.enforceReadPolicy(_$pageIndexAtom);
    _$pageIndexAtom.reportObserved();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.context.conditionallyRunInAction(() {
      super.pageIndex = value;
      _$pageIndexAtom.reportChanged();
    }, _$pageIndexAtom, name: '${_$pageIndexAtom.name}_set');
  }

  final _$bottomNavBarAtom = Atom(name: '_HomepageStore.bottomNavBar');

  @override
  bool get bottomNavBar {
    _$bottomNavBarAtom.context.enforceReadPolicy(_$bottomNavBarAtom);
    _$bottomNavBarAtom.reportObserved();
    return super.bottomNavBar;
  }

  @override
  set bottomNavBar(bool value) {
    _$bottomNavBarAtom.context.conditionallyRunInAction(() {
      super.bottomNavBar = value;
      _$bottomNavBarAtom.reportChanged();
    }, _$bottomNavBarAtom, name: '${_$bottomNavBarAtom.name}_set');
  }

  final _$_HomepageStoreActionController =
      ActionController(name: '_HomepageStore');

  @override
  void setPageIndex(int i) {
    final _$actionInfo = _$_HomepageStoreActionController.startAction();
    try {
      return super.setPageIndex(i);
    } finally {
      _$_HomepageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBottomNavBar(bool b) {
    final _$actionInfo = _$_HomepageStoreActionController.startAction();
    try {
      return super.setBottomNavBar(b);
    } finally {
      _$_HomepageStoreActionController.endAction(_$actionInfo);
    }
  }
}
