import 'package:mobx/mobx.dart';

// Include generated file
part 'homepage_store.g.dart';

// This is the class used by rest of your codebase
class HomepageStore = _HomepageStore with _$HomepageStore;

abstract class _HomepageStore with Store {
  @observable
  int pageIndex = 0;

  @observable
  bool bottomNavBar = false;

  @action
  void setPageIndex(int i) {
    pageIndex = i;
  }

  @action
  void setBottomNavBar(bool b) {
    bottomNavBar = b;
  }
}
