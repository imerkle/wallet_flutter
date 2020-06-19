import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/stores/sort/sortable.dart';

// Include generated file
part 'sort.g.dart';

// This is the class used by rest of your codebase
class SortStore = _SortStore with _$SortStore;

class SortedViewDataMeta {
  SortedViewDataMeta({this.title, this.subtitle});
  String title, subtitle;
}

class SortedViewData {
  SortedViewData({@required this.meta, @required this.id});
  String id;
  List<SortedViewDataMeta> meta;
}

abstract class _SortStore with Store {
  _SortStore({@required this.sortables});

  @observable
  ObservableList<Sortable> sortables;

  ObservableList<SortedViewData> data = ObservableList<SortedViewData>();

  @action
  void activate(int index) {
    if (sortables[index].active == true) {
      this.changeDirection(index);
    } else {
      for (int i = 0; i < sortables.length; i++) {
        var x = sortables[i];
        if (i != index) {
          x.active = false;
        } else {
          x.active = true;
        }
      }
    }
  }

  @action
  void changeDirection(int index) {
    sortables[index].toggleDirection();
  }
}
