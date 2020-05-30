import 'package:mobx/mobx.dart';

// Include generated file
part 'network.g.dart';

// This is the class used by rest of your codebase
class NetworkStore = _NetworkStore with _$NetworkStore;

abstract class _NetworkStore with Store {
  @observable
  bool hasInternet = true;
}
