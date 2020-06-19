// Include generated file
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/models/config.dart';
import 'package:wallet_flutter/stores/main.dart';

part 'fabs.g.dart';

// This is the class used by rest of your codebase
class FabsStore = _FabsStore with _$FabsStore;

abstract class _FabsStore with Store {
  _FabsStore({this.parent});
  final MainStore parent;

  @observable
  String base = "btc";

  ObservableMap<String, String> selectedIds = ObservableMap<String, String>();

  @observable
  Map<String, List<String>> coinPairs = {
    "btc": ["btc", "btg"],
    "eth": ["eth"],
  };

  @computed
  String get id => selectedIds[base] != null ? selectedIds[base] : ids[0];

  @computed
  ConfigAtom get configAtom => parent.configStore.configs[id];

  @computed
  List<String> get ids => coinPairs[base];

  @computed
  String get baseName => parent.configStore.configs[base].name;

  @action
  void setId(String s) {
    selectedIds[base] = s;
  }
}
