import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/utils/constants.dart';

// Include generated file
part 'config.g.dart';

// This is the class used by rest of your codebase
class ConfigStore = _ConfigStore with _$ConfigStore;

abstract class _ConfigStore with Store {
  @observable
  Map<String, List<String>> coins = {};

  @observable
  String base = "btc";
  @observable
  String rel = "btc";

  @action
  void init() {
    configs.forEach((c) => coins.update(
        c.base, (List<String> val) => val + [c.rel],
        ifAbsent: () => [c.rel]));
  }

  @action
  void setRel(String s) {
    rel = s;
  }

  @action
  void setBase(String s) {
    base = s;
  }
}
