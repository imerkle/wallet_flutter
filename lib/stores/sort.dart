import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/services.dart';

// Include generated file
part 'sort.g.dart';

// This is the class used by rest of your codebase
class SortStore = _SortStore with _$SortStore;


class Sortable {
  Sortable(this.title, this.active, this.direction);
  String title;
  bool active;
  bool direction;
}
const platform = const MethodChannel('flutter.dev/rust');
abstract class _SortStore implements Store {
  _SortStore(this.sortables);
  @observable
  List<Sortable> sortables;

  @action activate(int index){
    callrust();
    if(sortables[index].active == true){
      this.changeDirection(index);
    }else{
      for (int i=0; i<sortables.length; i++) {
        if(i != index){
          sortables[i].active = false;
        }else{
          sortables[i].active = true;
        }
      }
    }
  }
  @action changeDirection(int index){
    sortables[index].direction = !sortables[index].direction;
  }
}
Future<void> callrust() async {
    final String seed_hex = await platform.invokeMethod('get_seed',{"mnemonic": "", "password": ""});
    debugPrint(seed_hex);
}