import 'package:mobx/mobx.dart';

// Include generated file
part 'settings.g.dart';

// This is the class used by rest of your codebase
class SettingsStore = _SettingsStore with _$SettingsStore;

enum SettingsEnum {
  wallet,
  config,
}

abstract class _SettingsStore with Store {
  @observable
  SettingsEnum settingsEnum = SettingsEnum.wallet;

  @action
  void setSettingsEnum(SettingsEnum i) {
    settingsEnum = i;
  }
}
