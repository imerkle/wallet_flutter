import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/stores/main.dart';


const double tsize = 20;
const ts1 = TextStyle(fontSize: tsize);
const ts2 = TextStyle(fontSize: tsize, fontWeight: FontWeight.bold);

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
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 30,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("${x.ticker} balance".toUpperCase(), style: ts1),
                      Text("0", style: ts2),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("USD value".toUpperCase(), style: ts1),
                      Text("\$0", style: ts2),
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
              Text(
                AppLocalizations.of(context).tr('send_tx').toUpperCase(),
                style:  TextStyle(
                  color: Color(0xffbec0c4),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                )
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Recieving Address',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.content_paste),
                    onPressed: () {
                      Clipboard.getData("text/plain");
                    }
                  ),
                ),
              ),     
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '${x.ticker} Amount',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.content_paste),
                    onPressed: () {
                      Clipboard.getData("text/plain");
                    }
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
