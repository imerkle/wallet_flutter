// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FolderStore on _FolderStore, Store {
  Computed<Option> _$optionComputed;

  @override
  Option get option => (_$optionComputed ??=
          Computed<Option>(() => super.option, name: '_FolderStore.option'))
      .value;
  Computed<Folder> _$folderComputed;

  @override
  Folder get folder => (_$folderComputed ??=
          Computed<Folder>(() => super.folder, name: '_FolderStore.folder'))
      .value;
  Computed<List<String>> _$idsComputed;

  @override
  List<String> get ids => (_$idsComputed ??=
          Computed<List<String>>(() => super.ids, name: '_FolderStore.ids'))
      .value;

  final _$foldersAtom = Atom(name: '_FolderStore.folders');

  @override
  List<Folder> get folders {
    _$foldersAtom.reportRead();
    return super.folders;
  }

  @override
  set folders(List<Folder> value) {
    _$foldersAtom.reportWrite(value, super.folders, () {
      super.folders = value;
    });
  }

  final _$folderIndexAtom = Atom(name: '_FolderStore.folderIndex');

  @override
  int get folderIndex {
    _$folderIndexAtom.reportRead();
    return super.folderIndex;
  }

  @override
  set folderIndex(int value) {
    _$folderIndexAtom.reportWrite(value, super.folderIndex, () {
      super.folderIndex = value;
    });
  }

  final _$idAtom = Atom(name: '_FolderStore.id');

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$_FolderStoreActionController = ActionController(name: '_FolderStore');

  @override
  void setId(String s) {
    final _$actionInfo =
        _$_FolderStoreActionController.startAction(name: '_FolderStore.setId');
    try {
      return super.setId(s);
    } finally {
      _$_FolderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
folders: ${folders},
folderIndex: ${folderIndex},
id: ${id},
option: ${option},
folder: ${folder},
ids: ${ids}
    ''';
  }
}
