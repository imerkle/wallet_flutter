import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'sortable.g.dart';

class Sortable = _Sortable with _$Sortable;

enum SortDirection { asc, desc }

abstract class _Sortable with Store {
  _Sortable(
      {@required this.title,
      this.active = false,
      this.direction = SortDirection.asc});

  String title;
  @observable
  bool active;
  @observable
  SortDirection direction;

  @action
  void toggleDirection() {
    direction =
        direction == SortDirection.asc ? SortDirection.desc : SortDirection.asc;
  }
}
