import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/ui/folders/folders.dart';
import 'package:wallet_flutter/utils/app_localization.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/utils/fn.dart';
import 'package:wallet_flutter/widgets/common_widgets.dart';
import 'package:wallet_flutter/widgets/refresh_footer.dart';
import 'package:wallet_flutter/widgets/screen_header.dart';
import 'package:flutter_icons/flutter_icons.dart';

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
  final double h = 20;

  refresh(BuildContext context) async {
    final walletStore = Provider.of<MainStore>(context).walletStore;
    final balanceStore = Provider.of<MainStore>(context).balanceStore;
    final configStore = Provider.of<MainStore>(context).configStore;
    final folderStore = Provider.of<MainStore>(context).folderStore;

    await Future.wait([
      balanceStore.fetchBalance(
          option: folderStore.option, coinKey: walletStore.currentCoinKey),
      balanceStore.fetchPrice(option: folderStore.option),
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
    final folderStore = Provider.of<MainStore>(context).folderStore;
    final transactionStore = Provider.of<MainStore>(context).transactionStore;
    final mainStore = Provider.of<MainStore>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ScreenHeader(
          child: Text(
            folderStore.option.name,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
          child: SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            controller: _refreshController,
            onRefresh: () async {
              refresh(context);
            },
            header: ClassicHeader(),
            footer: RefreshFooter(),
            child: Observer(
              builder: (_) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    //child: Wrap(
                    //runSpacing: 15,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      BalanceHeader(
                        ticker: folderStore.option.ticker,
                        value: balanceStore.currentBalanceNormalized.unlocked,
                        fiatSymbol: mainStore.fiat.symbol,
                        fiatValue:
                            balanceStore.currentBalanceNormalized.unlocked *
                                balanceStore.currentPrice,
                      ),
                      SizedBox(
                        height: h,
                      ),
                      AddressHeader(
                        ticker: folderStore.option.ticker,
                        address: walletStore.currentCoinKey.address,
                      ),
                      SizedBox(
                        height: h,
                      ),
                      Container(
                        child: HeaderGrey1(
                          AppLocalizations.of(context)
                              .tr('send_tx')
                              .toUpperCase(),
                        ),
                      ),
                      SizedBox(
                        height: h,
                      ),
                      ScanTextField(
                          controller: receivingAddress,
                          onScan: (text) => this.receivingAddress.text = text),
                      SizedBox(
                        height: h,
                      ),
                      NormalTextField(
                        controller: amount,
                        labelText: this._amountInFiat
                            ? '${mainStore.fiat.ticker.toUpperCase()} Amount'
                            : '${folderStore.option.ticker.toUpperCase()} Amount',
                        prefixIcon: FlatButton(
                          child: Text("MAX"),
                          onPressed: () {
                            if (_amountInFiat) {
                              amount.text = (balanceStore
                                          .currentBalanceNormalized.unlocked *
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
                              : folderStore.option.ticker.toUpperCase()),
                          onPressed: () {
                            setState(() {
                              _amountInFiat = !this._amountInFiat;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: SimpleButton(
                          onPressed: () async {
                            transactionStore.sendTx(
                                amount: textToDouble(amount.text),
                                amountInFiat: _amountInFiat,
                                receivingAddress: receivingAddress.text);
                          },
                          child: Text('Send'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AddressHeader extends StatelessWidget {
  AddressHeader({this.ticker, this.address});

  final String ticker;
  final String address;

  @override
  Widget build(BuildContext context) {
    return RoundedContainerDark(
      child: Row(
        children: [
          IconButton(
              icon: Icon(MaterialCommunityIcons.qrcode),
              onPressed: () {
                bottomModal(
                  context: context,
                  header: "Scan address",
                  child: Center(
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.transparent,
                          width: 0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        overflow: Overflow.visible,
                        children: [
                          Positioned(
                            child: FabCircle(
                              padding: 5,
                              bgcolor: Theme.of(context).primaryColorDark,
                              url: cryptoIconUrl(ticker),
                              size: 35,
                            ),
                            top: -35,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  APPNAME,
                                  style:
                                      Theme.of(context).textTheme.headerMaster,
                                ),
                              ),
                              QrImage(
                                data: address,
                                version: QrVersions.auto,
                                size: 200,
                                backgroundColor: Colors.white,
                              ),
                              SizedBox(height: 10),
                              HeaderGrey1(
                                address,
                              ),
                            ],
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(15.0),
                    ),
                  ),
                );
              }),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderGrey1(
                  "Your ${ticker.toUpperCase()} address",
                ),
                SelectableText(
                  address,
                ),
              ],
            ),
          ),
          IconButton(
              icon: Icon(Icons.content_copy),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: address));
              })
        ],
      ),
    );
  }
}

class BalanceHeader extends StatelessWidget {
  BalanceHeader({this.ticker, this.value, this.fiatSymbol, this.fiatValue});
  final String ticker, fiatSymbol;
  final double value, fiatValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(children: <Widget>[
        Text(
            "${valueToPretty(value, CRYPTO_PRECISION)} ${ticker.toUpperCase()}",
            style: Theme.of(context).textTheme.headline6),
        Text("$fiatSymbol${valueToPretty(fiatValue, FIAT_PRECISION)}",
            style: Theme.of(context).textTheme.headerGrey2),
      ]),
    );
  }
}
