import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:progress_button/progress_button.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/constants.dart';
import 'package:wallet_flutter/gen/cargo/protos/coin.pb.dart';
import 'package:wallet_flutter/screens/scan.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:http/http.dart' as http;

const platform = const MethodChannel('flutter.dev/rust');

const double tsize = 20;
const ts1 = TextStyle(fontSize: tsize);
const ts2 = TextStyle(fontSize: tsize, fontWeight: FontWeight.bold);


class Wallet extends StatefulWidget {
  const Wallet({
    Key key,
  }) : super(key: key);

  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  ButtonState _sendButtonState = ButtonState.normal;

  final receivingAddress = TextEditingController();

  final amount = TextEditingController();

  @override
  Widget build(context){
    final walletStore = Provider.of<MainStore>(context).walletStore;
    final mainStore = Provider.of<MainStore>(context);

    return Observer(
      builder: (_) {
        Coins a = mainStore.coinListFromBase;
        Coin x = mainStore.coinFromRel;
        
        var b = walletStore.getBalance(rel: x.rel, base: a.base);
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
                        Text(b.balance.toStringAsFixed(CRYPTO_PRECISION), style: ts2),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("USD value".toUpperCase(), style: ts1),
                        Text("${walletStore.fiat.symbol}${b.fiat.toStringAsFixed(FIAT_PRECISION)}", style: ts2),
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
                        amount.text = b.toString();
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ProgressButton(
                    onPressed: () async{
                      
                      Outputs os = Outputs();
                      Output o = Output();
                      o.address = receivingAddress.text;

                      o.value = textToDouble(amount.text);
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
                      setState(() {
                        _sendButtonState = ButtonState.inProgress;
                      });
                      //sendTransaction(x.rel, a.base, t.txHex);           
                      //send tx_signed_hex
                    },

                    //padding: EdgeInsets.all(15),
                    //shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
                    child: Text(
                      'Send',
                      style: TextStyle(fontSize: 20)
                    ),
                    buttonState: _sendButtonState,
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
  var response = await http.post("${explorerApi}/post_tx", body: {'rel': rel, 'base': base, 'rawTx': rawTx});
  print('Response body: ${response.body}');
}