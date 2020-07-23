import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TxLabels extends StatelessWidget {
  final String label, value;
  TxLabels({this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: (Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("$label:"),
          SelectableText(value, style: TextStyle(color: Colors.white70)),
        ],
      )),
    );
  }
}
