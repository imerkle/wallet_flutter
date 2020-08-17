// Include generated file
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/ui/folders/folder.dart';
import 'package:wallet_flutter/utils/fn.dart';

part 'folder_store.g.dart';

var DEFAULT_FOLDERS = ObservableList.of([
  Folder(
    ids: ObservableList.of(["btc", "btg"]),
    name: "Bitcoin",
    logo: cryptoIconUrl("btc"),
  ),
  Folder(
    ids: ObservableList.of(["eth"]),
    name: "Ethereum",
    logo: cryptoIconUrl("eth"),
  ),
]);

// This is the class used by rest of your codebase
class FolderStore = _FolderStore with _$FolderStore;

abstract class _FolderStore with Store {
  _FolderStore();

  ObservableList<Folder> folders = DEFAULT_FOLDERS;

  @observable
  int selectedIndex = 0;

  @computed
  Folder get folder => folders[selectedIndex];

  @computed
  String get id => folder.ids[folder.selectedIdIndex];

  /// set current folder
  @action
  void setSelectedIndex(int i) {
    selectedIndex = i;
  }

  /// set current id in current folder
  @action
  void setSelectedId(String s) {
    folder.selectedIdIndex = folder.ids.indexOf(s);
    //print(folders[selectedIndex].selectedIdIndex);
  }
}
