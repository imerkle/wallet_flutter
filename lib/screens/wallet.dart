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
    final balanceStore = Provider.of<MainStore>(context).balanceStore;
    final configStore = Provider.of<MainStore>(context).configStore;
    final mainStore = Provider.of<MainStore>(context);

    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: _refreshController,
      onRefresh: () async {
        //await balanceStore.refreshBalances(mainStore.fiat);
        _refreshController.refreshCompleted();
      },
      header: ClassicHeader(),
      footer: RefreshFooter(),
      child: Observer(builder: (_) {
        var id = configStore.id;
        var base = configStore.base;
        var coin = mainStore.coin;
        var atom = configStore.configs[configStore.id];

        var balanceNormalized = balanceStore.getBalanceNormalized(atom);

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Wrap(
              runSpacing: 30,
              children: <Widget>[
                BalanceHeader(
                    rel: atom.ticker,
                    bal: valueToPretty(
                        balanceNormalized.unlocked, CRYPTO_PRECISION),
                    fiatSymbol: balanceStore.fiat.symbol,
                    fiatBal: valueToPretty(
                        balanceNormalized.unlocked * b.price, FIAT_PRECISION)),
                AddressHeader(ticker: atom.ticker, address: coin.address),
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
                        ? '${balanceStore.fiat.ticker.toUpperCase()} Amount'
                        : '${atom.ticker.toUpperCase()} Amount',
                    prefixIcon: FlatButton(
                      child: Text("MAX"),
                      onPressed: () {
                        if (_amountInFiat) {
                          amount.text = (b.price * b.value).toString();
                        } else {
                          amount.text = b.value.toString();
                        }
                      },
                    ),
                    suffixIcon: FlatButton(
                      child: Text(this._amountInFiat
                          ? balanceStore.fiat.ticker.toUpperCase()
                          : atom.ticker.toUpperCase()),
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
                            ? textToDouble(amount.text) / b.price
                            : textToDouble(amount.text)
                        ..memo = "";
                      o.address = receivingAddress.text;
                      os.list.add(o);

                      var txOpts = await getTransactionOpts(
                          atom: atom, address: coin.address);
                      var input = GenSendTxInput()
                        ..config = atom.config
                        ..privateKey = coin.privateKey
                        ..publicKey = coin.publicKey
                        ..outputs = os
                        ..txOpts = txOpts;

                      var res = await mainStore.rust.invokeRustMethod(
                          'gen_send_transaction', input.writeToBuffer());
                      var t = Tx.fromBuffer(res);
                      print(t);
                      sendTransaction(rel: rel, base: base, rawTx: t.txHex);
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
  AddressHeader({this.ticker, this.address});

  final String ticker;
  final String address;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: TextEditingController(text: address),
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Your $ticker Address',
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
