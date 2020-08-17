// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Folder on _Folder, Store {
  final _$idsAtom = Atom(name: '_Folder.ids');

  @override
  ObservableList<String> get ids {
    _$idsAtom.reportRead();
    return super.ids;
  }

  @override
  set ids(ObservableList<String> value) {
    _$idsAtom.reportWrite(value, super.ids, () {
      super.ids = value;
    });
  }

  final _$logoAtom = Atom(name: '_Folder.logo');

  @override
  String get logo {
    _$logoAtom.reportRead();
    return super.logo;
  }

  @override
  set logo(String value) {
    _$logoAtom.reportWrite(value, super.logo, () {
      super.logo = value;
    });
  }

  final _$nameAtom = Atom(name: '_Folder.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$selectedIdIndexAtom = Atom(name: '_Folder.selectedIdIndex');

  @override
  int get selectedIdIndex {
    _$selectedIdIndexAtom.reportRead();
    return super.selectedIdIndex;
  }

  @override
  set selectedIdIndex(int value) {
    _$selectedIdIndexAtom.reportWrite(value, super.selectedIdIndex, () {
      super.selectedIdIndex = value;
    });
  }

  @override
  String toString() {
    return '''
ids: ${ids},
logo: ${logo},
name: ${name},
selectedIdIndex: ${selectedIdIndex}
    ''';
  }
}
