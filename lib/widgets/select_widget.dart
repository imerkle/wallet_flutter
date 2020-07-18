import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/stores/select.dart';

class NormalSelect<T> extends StatelessWidget {
  NormalSelect({
    @required this.childWidget,
    @required this.onChanged,
    @required this.values,
    this.index = 0,
  });
  final Widget Function(T) childWidget;
  final void Function(T) onChanged;
  final Iterable<T> values;
  final int index;

  @override
  Widget build(BuildContext context) {
    final selectStore =
        SelectStore(values: ObservableList.of(values), index: index);

    return Observer(
      builder: (_) => DropdownButton<T>(
        value: selectStore.value,
        isExpanded: true,
        items: selectStore.values
            .map(
              (e) => DropdownMenuItem<T>(
                value: e,
                child: childWidget(e),
              ),
            )
            .toList(),
        onChanged: (T x) {
          selectStore.setIndex(selectStore.values.indexOf(x));
          onChanged(x);
        },
        underline: Container(),
      ),
    );
  }
}
