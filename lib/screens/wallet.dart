import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../utils/app_localization.dart';
import '../utils/constants.dart';
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

class _WalletState extends State<Wallet> with AfterInitMixin<Wallet> {
  bool _amountInFiat = false;

  final receivingAddress = TextEditingController();
  final amount = TextEditingController();

  refresh(BuildContext context) async {
    final walletStore = Provider.of<MainStore>(context).walletStore;
    final balanceStore = Provider.of<MainStore>(context).balanceStore;
    final configStore = Provider.of<MainStore>(context).configStore;

    await Future.wait([
      balanceStore.fetchBalance(
          atom: configStore.configAtom, coinKey: walletStore.currentCoinKey),
      balanceStore.fetchPrice(atom: configStore.configAtom),
    ]);
    _refreshController.refreshCompleted();
  }

  @override
  void didInitState() {
    refresh(context);
  }

  @override
  Widget build(context) {
    final walletStore = Provider.of<MainStore>(context).walletStore;
    final balanceStore = Provider.of<MainStore>(context).balanceStore;
    final configStore = Provider.of<MainStore>(context).configStore;
    final transactionStore = Provider.of<MainStore>(context).transactionStore;
    final mainStore = Provider.of<MainStore>(context);

    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: _refreshController,
      onRefresh: () async {
        refresh(context);
      },
      header: ClassicHeader(),
      footer: RefreshFooter(),
      child: Observer(builder: (_) {
        var base = configStore.base;
        var configAtom = configStore.configAtom;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Wrap(
              runSpacing: 30,
              children: <Widget>[
                BalanceHeader(
                    rel: configAtom.ticker,
                    bal: valueToPretty(
                        balanceStore.currentBalanceNormalized.unlocked,
                        CRYPTO_PRECISION),
                    fiatSymbol: mainStore.fiat.symbol,
                    fiatBal: valueToPretty(
                        balanceStore.currentBalanceNormalized.unlocked *
                            balanceStore.currentPrice,
                        FIAT_PRECISION)),
                AddressHeader(
                    ticker: configAtom.ticker,
                    address: walletStore.currentCoinKey.address),
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
                        : '${configAtom.ticker.toUpperCase()} Amount',
                    prefixIcon: FlatButton(
                      child: Text("MAX"),
                      onPressed: () {
                        if (_amountInFiat) {
                          amount.text =
                              (balanceStore.currentBalanceNormalized.unlocked *
                                      balanceStore.currentPrice)
                                  .toString();
                        } else {
                          amount.text = balanceStore
                              .currentBalanceNormalized.unlocked
                              .toString();
                        }
                      },
                    ),
                    suffixIcon: FlatButton(
                      child: Text(this._amountInFiat
                          ? mainStore.fiat.ticker.toUpperCase()
                          : configAtom.ticker.toUpperCase()),
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
                      transactionStore.sendTx(
                          amount: textToDouble(amount.text),
                          amountInFiat: _amountInFiat,
                          receivingAddress: receivingAddress.text);
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
