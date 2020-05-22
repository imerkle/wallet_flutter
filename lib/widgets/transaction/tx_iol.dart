import 'package:flutter/material.dart';
import 'tx_io.dart';

class TxIOL extends StatelessWidget {
  final String header;
  final List<dynamic> iol;

  TxIOL({this.iol, this.header});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        color: Colors.black38,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(header, style: TextStyle(fontSize: 20)),
            Column(
              children: iol.map((x) {
                return TxIO(t: x);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
