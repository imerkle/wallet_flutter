// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homepage_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomepageStore on _HomepageStore, Store {
  final _$pageIndexAtom = Atom(name: '_HomepageStore.pageIndex');

  @override
  int get pageIndex {
    _$pageIndexAtom.reportRead();
    return super.pageIndex;
  }

  @override
  set pageIndex(int value) {
    _$pageIndexAtom.reportWrite(value, super.pageIndex, () {
      super.pageIndex = value;
    });
  }

  final _$bottomNavBarAtom = Atom(name: '_HomepageStore.bottomNavBar');

  @override
  bool get bottomNavBar {
    _$bottomNavBarAtom.reportRead();
    return super.bottomNavBar;
  }

  @override
  set bottomNavBar(bool value) {
    _$bottomNavBarAtom.reportWrite(value, super.bottomNavBar, () {
      super.bottomNavBar = value;
    });
  }

  final _$_HomepageStoreActionController =
      ActionController(name: '_HomepageStore');

  @override
  void setPageIndex(int i) {
    final _$actionInfo = _$_HomepageStoreActionController.startAction(
        name: '_HomepageStore.setPageIndex');
    try {
      return super.setPageIndex(i);
    } finally {
      _$_HomepageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBottomNavBar(bool b) {
    final _$actionInfo = _$_HomepageStoreActionController.startAction(
        name: '_HomepageStore.setBottomNavBar');
    try {
      return super.setBottomNavBar(b);
    } finally {
      _$_HomepageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pageIndex: ${pageIndex},
bottomNavBar: ${bottomNavBar}
    ''';
  }
}
