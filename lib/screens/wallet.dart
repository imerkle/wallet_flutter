

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/stores/main.dart';

class Wallet extends StatelessWidget{

  @override
  Widget build(context){
    final coinStore = Provider.of<MainStore>(context).coinStore;
    final fabStore = Provider.of<MainStore>(context).fabStore;
    

    var selectedChild = fabStore.selectedChild;
    var selected = fabStore.selected;

    var x = coinStore.coinbase[selectedChild].coins[selected];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Wrap(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          runSpacing: 20,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("${x.ticker} balance"),
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
            TextField(
              readOnly: true,
              controller: TextEditingController(text: 'AddressXYZXYZ'),
              style: TextStyle(color: Colors.grey),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Your ${x.ticker} Address',
                suffixIcon: IconButton(
                  icon: Icon(Icons.content_copy),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: "AddressXYZXYZ"));
                  }
                ),
              ),
            ),
            Text("Send Transaction"),
          ],
        ),
    );
  }
}
