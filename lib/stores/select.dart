import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'select.g.dart';

// This is the class used by rest of your codebase
class SelectStore<T> = _SelectStore<T> with _$SelectStore;

abstract class _SelectStore<T> with Store {
  _SelectStore({@required this.values, this.index = 0});

  @observable
  ObservableList<T> values;

  @observable
  int index;

  @computed
  T get value => values[index];

  @action
  setIndex(int i) {
    index = i;
  }
}
