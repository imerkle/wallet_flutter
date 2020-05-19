import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wallet_flutter/gen/go-micro/services/chains/chain/chain.pb.dart';
import 'package:wallet_flutter/stores/wallet.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/utils/fn.dart';
import 'package:wallet_flutter/widgets/data_table.dart';
import 'package:wallet_flutter/widgets/transaction/tx_iol.dart';
import 'package:wallet_flutter/widgets/transaction/tx_labels.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/widgets/refresh_footer.dart';
import 'package:after_init/after_init.dart';
import 'package:intl/intl.dart';

RefreshController _refreshController = RefreshController(initialRefresh: false);

class TrasactionScreen extends StatefulWidget {
  @override
  _TrasactionScreenState createState() => _TrasactionScreenState();
}

class _TrasactionScreenState extends State<TrasactionScreen>
    with AfterInitMixin<TrasactionScreen> {
  refresh(BuildContext context) {
    final transactionStore = Provider.of<MainStore>(context).transactionStore;
    final mainStore = Provider.of<MainStore>(context);
    final configStore = Provider.of<MainStore>(context).configStore;
    final walletStore = Provider.of<MainStore>(context).walletStore;

    transactionStore.refreshTxs(
        id: configStore.id,
        address: walletStore.getCoinKey(configStore.id).address);
    _refreshController.refreshCompleted();
  }

  @override
  void didInitState() {
    final mainStore = Provider.of<MainStore>(context);

    if (mainStore.txs.length == 0) {
      refresh(context);
    }
  }

  void _showModalSheet(
      Transaction tx, BalanceNormalized b, String base, String rel) {
    final mainStore = Provider.of<MainStore>(context);
    final balanceStore = Provider.of<MainStore>(context).balanceStore;
    final configStore = Provider.of<MainStore>(context).configStore;
    final atom = configStore.coin;
    final price = balanceStore.getPrice(atom);
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (builder) {
          var fees = valueToPrecision(tx.fees, atom.precision);
          return Container(
            height: 500,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: FractionallySizedBox(
                          widthFactor: 0.1,
                          child: Container(
                            height: 4,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            child: Text("Transaction",
                                style: TextStyle(fontSize: 28)))),
                    TxLabels(label: "Id", value: tx.id),
                    /*TxLabels(
                        label: "Timestamp",
                        value: DateFormat("MMM-dd-yyyy hh:mm:ss a").format(
                            DateTime.fromMillisecondsSinceEpoch(
                                tx.timestamp * 1000))),*/
                    TxLabels(
                        label: "Fee",
                        value:
                            "${valueToPretty(fees, CRYPTO_PRECISION)}${rel.toUpperCase()} (${balanceStore.fiat.symbol}${valueToPretty(price * fees, FIAT_PRECISION)})"),
                    SizedBox(height: 10),
                    TxIOL(
                        header: "Inputs",
                        iol: tx.inputs,
                        id: rel,
                        fiat: balanceStore.fiat,
                        b: b),
                    SizedBox(height: 10),
                    TxIOL(
                        header: "Outputs",
                        iol: tx.outputs,
                        id: rel,
                        fiat: balanceStore.fiat,
                        b: b),
                  ]),
            ),
            padding: EdgeInsets.all(15.0),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final balanceStore = Provider.of<MainStore>(context).balanceStore;
    final configStore = Provider.of<MainStore>(context).configStore;
    final transactionStore = Provider.of<MainStore>(context).transactionStore;
    final mainStore = Provider.of<MainStore>(context);

    var base = configStore.base;
    var rel = configStore.id;

    var b = balanceStore.getBalanceNormalized(configStore.coin);
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: () async {
          await transactionStore.refreshTxs(
              base: base, rel: rel, address: mainStore.coin.address);
          _refreshController.refreshCompleted();
        },
        header: ClassicHeader(),
        footer: RefreshFooter(),
        child: Observer(builder: (_) {
          if (mainStore.txs.length > 0) {
            return MyDataTable(
                columnSpacing: 0,
                columns: [
                  MyDataColumn(label: Text("Txn Hash")),
                  MyDataColumn(label: Text("Age")),
                  MyDataColumn(label: Text("")),
                  MyDataColumn(label: Text("Value")),
                ],
                rows: mainStore.txs.map((tx) {
                  double valueRaw = 0.0;
                  if (tx.direction == 0) {
                    valueRaw = (tx.outputs.fold(0, (a, y) {
                      return mainStore.coin.address == y.address
                          ? a + y.value
                          : a;
                    }));
                  } else {
                    valueRaw = (tx.outputs.fold(0, (a, y) {
                      return mainStore.coin.address != y.address
                          ? a + y.value
                          : a;
                    }));
                  }
                  double value = valueToPrecision(valueRaw, rel);

                  return MyDataRow(
                      cells: [
                        MyDataCell(Text(smartTrim(tx.id, 10))),
                        MyDataCell(Text(timeago.format(
                            DateTime.fromMillisecondsSinceEpoch(
                                tx.timestamp * 1000),
                            maxSuffix: 3))),
                        MyDataCell(ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            width: 35,
                            padding: EdgeInsets.all(4),
                            color:
                                tx.direction == 0 ? Colors.green : Colors.red,
                            child: Text(
                              tx.direction == 0 ? "IN" : "OUT",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                        MyDataCell(Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                "${valueToPretty(value, CRYPTO_PRECISION)} ${rel.toUpperCase()}"),
                            Text(
                                "${balanceStore.fiat.symbol}${valueToPretty(b.price * value, FIAT_PRECISION)}",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        )),
                      ],
                      onSelectChanged: (bool _abc) {
                        print(tx.inputs[0].value);
                        _showModalSheet(tx, b, base, rel);
                      });
                }).toList());
          } else {
            return Container(child: Text("woo"));
          }
        }));
  }
}

String smartTrim(String string, int maxLength) {
  if (maxLength < 1) return string;
  if (string.length <= maxLength) return string;
  if (maxLength == 1) return string.substring(0, 1) + '...';

  var midpoint = (string.length / 2).ceil();
  var toremove = string.length - maxLength;
  var lstrip = (toremove / 2).ceil();
  var rstrip = toremove - lstrip;
  return string.substring(0, midpoint - lstrip) +
      '...' +
      string.substring(midpoint + rstrip);
}
