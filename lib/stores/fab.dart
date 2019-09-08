import 'package:mobx/mobx.dart';

// Include generated file
part 'fab.g.dart';

// This is the class used by rest of your codebase
class FabStore = _FabStore with _$FabStore;


abstract class _FabStore with Store {
  
  @observable
  int baseIndex = 0;
  @observable
  int relIndex = 0;

  @action 
  void setBaseIndex(int c){
    baseIndex = c;
  }
  @action 
  void setRelIndex(int c){
    relIndex = c;
  }
}