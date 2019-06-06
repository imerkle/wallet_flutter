import 'package:mobx/mobx.dart';

import 'coin.dart';
import 'fab.dart';
part 'main.g.dart';

class MainStore = _MainStore with _$MainStore;

abstract class _MainStore implements Store {
  CoinStore coinStore = new CoinStore();
  FabStore fabStore = new FabStore();
}
