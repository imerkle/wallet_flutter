import 'package:mobx/mobx.dart';

// Include generated file
part 'fab.g.dart';

// This is the class used by rest of your codebase
class FabStore = _FabStore with _$FabStore;


abstract class _FabStore implements Store {
  @observable
  int selected = 0;

  @action setSelected(int c){
    selected = c;
  }
}