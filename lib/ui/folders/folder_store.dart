// Include generated file
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/gen/pb/config.pb.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/utils/constants.dart';

part 'folder_store.g.dart';

// This is the class used by rest of your codebase
class FolderStore = _FolderStore with _$FolderStore;

class Folder {
  Folder({this.ids, this.logo, this.name});
  List<String> ids;
  String logo, name;
}

abstract class _FolderStore with Store {
  _FolderStore({this.parent});
  final MainStore parent;

  @observable
  List<Folder> folders = DEFAULT_FOLDERS;

  @observable
  int folderIndex = 0;

  @observable
  String id = DEFAULT_FOLDERS[0].ids[0];

  @computed
  Option get option => parent.configStore.options[id];

  @computed
  Folder get folder => folders[folderIndex];

  @computed
  List<String> get ids => folders[folderIndex].ids;

  @action
  void setId(String s) {
    id = s;
  }
}
