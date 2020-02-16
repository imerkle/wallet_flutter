import 'package:flutter/material.dart';
import 'package:wallet_flutter/models/transaction.dart' as T;
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/utils/fn.dart';

import 'tx_labels.dart';

class TxIO extends StatelessWidget {
  final T.Tx t;
  final String rel;
  TxIO({this.t, this.rel});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TxLabels(label: "Address", value: t.address),
        TxLabels(
            label: "Value",
            value: valueToPrecision(t.value, rel)
                .toStringAsFixed(CRYPTO_PRECISION)),
        Divider(),
      ],
    );
  }
}
