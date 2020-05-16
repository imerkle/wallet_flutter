import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/models/balance.dart';
import 'package:wallet_flutter/models/transaction.dart' as T;
import 'package:wallet_flutter/stores/balance.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/utils/fn.dart';

import 'tx_labels.dart';

class TxIO extends StatelessWidget {
  final T.Tx t;
  final String id;
  final Fiat fiat;
  final BalanceOut b;
  TxIO({this.t, this.id, this.fiat, this.b});
  @override
  Widget build(BuildContext context) {
    final configStore = Provider.of<MainStore>(context).configStore;
    var v = valueToPrecision(t.value, configStore.precisions[id]);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TxLabels(label: "Address", value: t.address),
        TxLabels(
            label: "Value",
            value:
                "${valueToPretty(v, CRYPTO_PRECISION)} (${fiat.symbol}${valueToPretty(v * b.price, FIAT_PRECISION)})"),
        Divider(),
      ],
    );
  }
}
