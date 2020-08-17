import 'package:mobx/mobx.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class Dummy {
  Dummy({this.text});
  String text;
}

void main() {
  testWidgets('Mobx test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    ObservableMap<String, Dummy> dummy =
        ObservableMap.of({"a": Dummy(text: "Hello World")});

    final dispose = autorun((_) {
      print(printDummy(dummy["a"]));
    });

    runInAction(() {
      dummy["a"] = Dummy(text: "Hello Mobx");
    });

    // Done with the autorun()
    dispose();
  });
}

String printDummy(Dummy d) {
  return d.text;
}
