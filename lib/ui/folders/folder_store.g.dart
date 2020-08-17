// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FolderStore on _FolderStore, Store {
  Computed<Folder> _$folderComputed;

  @override
  Folder get folder => (_$folderComputed ??=
          Computed<Folder>(() => super.folder, name: '_FolderStore.folder'))
      .value;
  Computed<String> _$idComputed;

  @override
  String get id => (_$idComputed ??=
          Computed<String>(() => super.id, name: '_FolderStore.id'))
      .value;

  final _$selectedIndexAtom = Atom(name: '_FolderStore.selectedIndex');

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  final _$_FolderStoreActionController = ActionController(name: '_FolderStore');

  @override
  void setSelectedIndex(int i) {
    final _$actionInfo = _$_FolderStoreActionController.startAction(
        name: '_FolderStore.setSelectedIndex');
    try {
      return super.setSelectedIndex(i);
    } finally {
      _$_FolderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedId(String s) {
    final _$actionInfo = _$_FolderStoreActionController.startAction(
        name: '_FolderStore.setSelectedId');
    try {
      return super.setSelectedId(s);
    } finally {
      _$_FolderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedIndex: ${selectedIndex},
folder: ${folder},
id: ${id}
    ''';
  }
}
