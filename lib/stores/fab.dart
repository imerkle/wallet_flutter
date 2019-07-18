import 'package:mobx/mobx.dart';

// Include generated file
part 'fab.g.dart';

// This is the class used by rest of your codebase
class FabStore = _FabStore with _$FabStore;


abstract class _FabStore with Store {
  
  @observable
  int selected = 0;
  @observable
  int selectedChild = 0;

  @action 
  void setSelected(int c){
    selected = c;
  }
  @action 
  void setSelectedChild(int c){
    selectedChild = c;
  }
}