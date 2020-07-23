import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/utils/fn.dart';

import 'tx_labels.dart';

class TxIO extends StatelessWidget {
  final dynamic t;
  TxIO({this.t});
  @override
  Widget build(BuildContext context) {
    final balanceStore = Provider.of<MainStore>(context).balanceStore;
    final mainStore = Provider.of<MainStore>(context);
    final configStore = Provider.of<MainStore>(context).configStore;
    final folderStore = Provider.of<MainStore>(context).folderStore;

    var v = valueToPrecision(t.value, folderStore.option.precision);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TxLabels(label: "Address", value: t.address),
        TxLabels(
            label: "Value",
            value:
                "${valueToPretty(v, CRYPTO_PRECISION)} (${mainStore.fiat.symbol}${valueToPretty(v * balanceStore.currentPrice, FIAT_PRECISION)})"),
        Divider(),
      ],
    );
  }
}
