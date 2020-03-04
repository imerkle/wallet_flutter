import 'package:flutter/material.dart';
import 'package:wallet_flutter/models/balance.dart';
import 'package:wallet_flutter/models/transaction.dart' as T;
import 'package:wallet_flutter/stores/balance.dart';

import 'tx_io.dart';

class TxIOL extends StatelessWidget {
  final String header, rel;
  final List<T.Tx> iol;

  final Fiat fiat;
  final BalanceOut b;
  TxIOL({this.iol, this.header, this.rel, this.fiat, this.b});
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
                return TxIO(t: x, rel: rel, fiat: fiat, b: b);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
