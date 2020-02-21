import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../utils/api.dart';
import '../utils/app_localization.dart';
import '../utils/constants.dart';
import '../gen/cargo/protos/coin.pb.dart';
import '../utils/fn.dart';
import '../stores/main.dart';
import '../widgets/refresh_footer.dart';

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

RefreshController _refreshController = RefreshController(initialRefresh: false);

class _WalletState extends State<Wallet> {
  bool _amountInFiat = false;

  final receivingAddress = TextEditingController();
  final amount = TextEditingController();

  @override
  Widget build(context) {
    final walletStore = Provider.of<MainStore>(context).walletStore;
    final mainStore = Provider.of<MainStore>(context);

    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: _refreshController,
      onRefresh: () async {
        await walletStore.refreshBalances(mainStore.fiat);
        _refreshController.refreshCompleted();
      },
      header: ClassicHeader(),
      footer: RefreshFooter(),
      child: Observer(builder: (_) {
        Coins a = mainStore.coinListFromBase;
        Coin x = mainStore.coinFromRel;

        var b = walletStore.getBalance(rel: x.rel, base: a.base);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Wrap(
              runSpacing: 30,
              children: <Widget>[
                BalanceHeader(
                    rel: x.rel,
                    bal: valueToPretty(b.balance, CRYPTO_PRECISION),
                    fiatSymbol: mainStore.fiat.symbol,
                    fiatBal: valueToPretty(b.balance * b.fiat, FIAT_PRECISION)),
                AddressHeader(rel: x.rel, address: x.address),
                Text(AppLocalizations.of(context).tr('send_tx').toUpperCase(),
                    style: TextStyle(
                      color: Color(0xffbec0c4),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    )),
                ScanTextField(
                    controller: receivingAddress,
                    onScan: (text) => this.receivingAddress.text = text),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: amount,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: this._amountInFiat
                        ? '${mainStore.fiat.ticker.toUpperCase()} Amount'
                        : '${x.rel.toUpperCase()} Amount',
                    prefixIcon: FlatButton(
                      child: Text("MAX"),
                      onPressed: () {
                        if (_amountInFiat) {
                          amount.text = (b.fiat * b.balance).toString();
                        } else {
                          amount.text = b.balance.toString();
                        }
                      },
                    ),
                    suffixIcon: FlatButton(
                      child: Text(this._amountInFiat
                          ? mainStore.fiat.ticker.toUpperCase()
                          : x.rel.toUpperCase()),
                      onPressed: () {
                        setState(() {
                          _amountInFiat = !this._amountInFiat;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    onPressed: () async {
                      Outputs os = Outputs();
                      Output o = Output()
                        ..address = receivingAddress.text
                        ..value = _amountInFiat
                            ? textToDouble(amount.text) / b.fiat
                            : textToDouble(amount.text)
                        ..memo = "";
                      o.address = receivingAddress.text;
                      os.list.add(o);
                      print(o.value);

                      var txOpts = await getTransactionOpts(
                          rel: x.rel, base: a.base, address: x.address);
                      var input = GenSendTxInput()
                        ..config = getConfig(x.rel, a.base)
                        ..privateKey = x.privateKey
                        ..publicKey = x.publicKey
                        ..outputs = os
                        ..txOpts = txOpts;

                      var res = await mainStore.rust.invokeRustMethod(
                          'gen_send_transaction', input.writeToBuffer());
                      var t = Tx.fromBuffer(res);
                      print(t);
                      sendTransaction(rel: x.rel, base: a.base, rawTx: t.txHex);
                    },

                    //padding: EdgeInsets.all(15),
                    //shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0)),
                    child: Text('Send', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class AddressHeader extends StatelessWidget {
  AddressHeader({this.rel, this.address});

  final String rel;
  final String address;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: TextEditingController(text: address),
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Your $rel Address',
        suffixIcon: IconButton(
            icon: Icon(Icons.content_copy),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: address));
            }),
      ),
    );
  }
}

class BalanceHeader extends StatelessWidget {
  BalanceHeader({this.rel, this.bal, this.fiatSymbol, this.fiatBal});
  final String rel;
  final String bal;
  final String fiatSymbol;
  final String fiatBal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("$rel balance".toUpperCase(), style: ts1),
            Text(bal, style: ts2),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("USD value".toUpperCase(), style: ts1),
            Text("$fiatSymbol$fiatBal", style: ts2),
          ],
        ),
      ],
    );
  }
}

class ScanTextField extends StatelessWidget {
  ScanTextField({this.controller, this.onScan});

  final TextEditingController controller;
  final Function onScan;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Recieving Address',
        prefixIcon: IconButton(
            icon: Icon(Icons.center_focus_weak),
            onPressed: () {
              scan(onScan);
            }),
        suffixIcon: IconButton(
            icon: Icon(Icons.content_paste),
            onPressed: () {
              writePaste(this.controller);
            }),
      ),
    );
  }
}
