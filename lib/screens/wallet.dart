import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/constants.dart';
import 'package:wallet_flutter/gen/cargo/protos/coin.pb.dart';
import 'package:wallet_flutter/models/balance.dart';
import 'package:wallet_flutter/screens/scan.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:http/http.dart' as http;
import 'package:wallet_flutter/stores/wallet.dart';

const platform = const MethodChannel('flutter.dev/rust');

const double tsize = 20;
const ts1 = TextStyle(fontSize: tsize);
const ts2 = TextStyle(fontSize: tsize, fontWeight: FontWeight.bold);

Balance getBalance(WalletStore walletStore, String base, String rel){
  walletStore.bl.forEach((b) => print(b.base));
  //return walletStore.bl.singleWhere((b) => b.base == base).balances.singleWhere((b)=> b.rel == rel);
  return Balance(rel: rel, value: 0.0);
}
class Wallet extends StatelessWidget {
  final receivingAddress = TextEditingController();
  final amount = TextEditingController();

  @override
  Widget build(context){
    final walletStore = Provider.of<MainStore>(context).walletStore;
    final fabStore = Provider.of<MainStore>(context).fabStore;

    return Observer(
      builder: (_) {
        var x = getCoin(store: walletStore, baseIndex: fabStore.baseIndex, relIndex: fabStore.relIndex);
        Balance b = getBalance(walletStore, x.base, x.rel);
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
                        Text("${x.rel} balance".toUpperCase(), style: ts1),
                        Text(b.value.toString(), style: ts2),
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
                  controller: TextEditingController(text: x.address),
                  style: TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your ${x.rel} Address',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.content_copy),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: x.address));
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
                ScanScreen(controller: receivingAddress, onScan: (text) => this.receivingAddress.text = text),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: amount,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '${x.rel.toUpperCase()} Amount',
                    suffixIcon: FlatButton(
                      child: Text("MAX"), 
                      onPressed: () {
                        amount.text = b.value.toString();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () async{
                      
                      Outputs os = Outputs();
                      Output o = Output();
                      o.address = receivingAddress.text;
                      o.value = double.parse(amount.text);
                      o.memo = "";
                      os.list.add(o);
                      
                      var txSignedHex = await platform.invokeMethod('gen_send_transaction',{
                        "rel": x.rel,
                        "isTestnet": isTestnet,
                        "api": explorerApi,
                        "privateKey": x.privateKey,
                        "publicKey": x.publicKey,
                        "txOutputs": os.writeToBuffer()
                      });
                      var t = Tx.fromBuffer(txSignedHex);
                      //sendTransaction(x.rel, x.rel, tx_signed_hex);
                      //send tx_signed_hex
                    },
                    padding: EdgeInsets.all(15),
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
                    child: Text(
                      'Send',
                      style: TextStyle(fontSize: 20)
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}

Future<String> sendTransaction(String rel, String base, String rawTx) async {
  var response = await http.post('http://localhost:4000/api/post_tx', body: {'rel': rel, 'base': base, 'rawTx': rawTx});
  print('Response body: ${response.body}');
}