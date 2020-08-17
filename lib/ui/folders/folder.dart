import 'package:mobx/mobx.dart';

part 'folder.g.dart';

class Folder = _Folder with _$Folder;

abstract class _Folder with Store {
  _Folder({this.ids, this.logo, this.name});
  @observable
  ObservableList<String> ids;

  @observable
  String logo, name;

  @observable
  int selectedIdIndex = 0;
}
