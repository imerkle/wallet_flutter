

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/stores/main.dart';

class Wallet extends StatelessWidget{

  @override
  Widget build(context){
    final coinStore = Provider.of<MainStore>(context).coinStore;
    final fabStore = Provider.of<MainStore>(context).fabStore;
    

    var selectedChild = fabStore.selectedChild;
    var selected = fabStore.selected;

    var x = coinStore.coinbase[selected].coins[selected];

    return (
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(x.ticker + " balance"),
                Text("0"),
              ],
            ),
            Column(
              children: <Widget>[
                Text("USD balance"), //change to fiat store later
                Text("\$0"),
              ],
            ),
          ],
        ),
      )
    );
  }
}
