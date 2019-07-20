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
abstract class _SortStore with Store {
  //_SortStore(this.sortables);
  
  ObservableList<Sortable> sortables = ObservableList<Sortable>();

  @action 
  void activate(int index){
    callrust();
    if(sortables[index].active == true){
      this.changeDirection(index);
    }else{
      for (int i=0; i<sortables.length; i++) {
        var x = sortables[i];
        if(i != index){
          x.active = false;
        }else{
          x.active = true;
        }
        sortables.removeAt(i);
        sortables.insert(i, x);        
      }
    }
  }

  @action
  void changeDirection(int index){
    var x = sortables[index];
    x.direction = !x.direction;
    sortables.removeAt(index);
    sortables.insert(index, x);
  }
}
Future<void> callrust() async {
    final String seed_hex = await platform.invokeMethod('get_seed',{"mnemonic": "", "password": ""});
    debugPrint(seed_hex);
}