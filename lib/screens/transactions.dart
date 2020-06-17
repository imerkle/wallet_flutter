import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wallet_flutter/gen/chains/chain/chain.pb.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/utils/fn.dart';
import 'package:wallet_flutter/widgets/data_table.dart';
import 'package:wallet_flutter/widgets/screen_header.dart';
import 'package:wallet_flutter/widgets/transaction/tx_iol.dart';
import 'package:wallet_flutter/widgets/transaction/tx_labels.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/widgets/refresh_footer.dart';
import 'package:after_init/after_init.dart';
import 'package:intl/intl.dart';
import 'package:fixnum/fixnum.dart';

RefreshController _refreshController = RefreshController(initialRefresh: false);

class TransanctionScreen extends StatefulWidget {
  @override
  _TransanctionScreenState createState() => _TransanctionScreenState();
}

class _TransanctionScreenState extends State<TransanctionScreen>
    with AfterInitMixin<TransanctionScreen> {
  refresh(BuildContext context) async {
    final transactionStore = Provider.of<MainStore>(context).transactionStore;

    await transactionStore.refreshTxs();
    _refreshController.refreshCompleted();
  }

  @override
  void didInitState() {
    final transactionStore = Provider.of<MainStore>(context).transactionStore;

    if (transactionStore.currentTxs.length == 0) {
      refresh(context);
    }
  }

  void _showModalSheet(Transaction tx, BalanceNormalized balanceNormalized,
      String base, String rel) {
    final balanceStore = Provider.of<MainStore>(context).balanceStore;
    final configStore = Provider.of<MainStore>(context).configStore;
    final mainStore = Provider.of<MainStore>(context);
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (builder) {
          var fees = valueToPrecision(
              tx.fees.used * tx.fees.price, configStore.configAtom.precision);
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
                            "${valueToPretty(fees, CRYPTO_PRECISION)}${rel.toUpperCase()} (${mainStore.fiat.symbol}${valueToPretty(balanceStore.currentPrice * fees, FIAT_PRECISION)})"),
                    SizedBox(height: 10),
                    TxIOL(header: "Inputs", iol: tx.inputs),
                    SizedBox(height: 10),
                    TxIOL(header: "Outputs", iol: tx.outputs),
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
    final walletStore = Provider.of<MainStore>(context).walletStore;
    final mainStore = Provider.of<MainStore>(context);

    var base = configStore.base;
    var rel = configStore.id;

    return Screen(
      header: "Transactions",
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
          builder: (_) {
            if (transactionStore.currentTxs.length > 0) {
              return MyDataTable(
                  columnSpacing: 0,
                  columns: [
                    MyDataColumn(label: Text("Txn Hash")),
                    MyDataColumn(label: Text("Age")),
                    MyDataColumn(label: Text("")),
                    MyDataColumn(label: Text("Value")),
                  ],
                  rows: transactionStore.currentTxs.map((tx) {
                    Int64 valueRaw = Int64.ZERO;
                    switch (tx.direction) {
                      case Direction.INCOMING:
                        valueRaw = (tx.outputs.fold(Int64.ZERO, (a, y) {
                          return walletStore.currentCoinKey.address == y.address
                              ? a + y.value
                              : a;
                        }));
                        break;
                      case Direction.OUTGOING:
                        valueRaw = (tx.outputs.fold(Int64.ZERO, (a, y) {
                          return walletStore.currentCoinKey.address != y.address
                              ? a + y.value
                              : a;
                        }));
                        break;
                      case Direction.SELF:
                        valueRaw = (tx.outputs.fold(Int64.ZERO, (a, y) {
                          return walletStore.currentCoinKey.address == y.address
                              ? a + y.value
                              : a;
                        }));
                        break;
                    }
                    double value = valueToPrecision(
                        valueRaw, configStore.configAtom.precision);

                    return MyDataRow(
                        cells: [
                          MyDataCell(Text(smartTrim(tx.id, 10))),
                          MyDataCell(Text(timeago.format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  tx.timestamp.timestamp.seconds.toInt() *
                                      1000),
                              maxSuffix: 3))),
                          MyDataCell(ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Container(
                              //width: 40,
                              padding: EdgeInsets.all(4),
                              color: colorFromDirection(tx.direction),
                              child: Text(
                                textFromDirection(tx.direction),
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
                                  "${mainStore.fiat.symbol}${valueToPretty(balanceStore.currentPrice * value, FIAT_PRECISION)}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )),
                        ],
                        onSelectChanged: (bool _abc) {
                          _showModalSheet(tx,
                              balanceStore.currentBalanceNormalized, base, rel);
                        });
                  }).toList());
            } else {
              return Container(child: Text("Transactions will show up here"));
            }
          },
        ),
      ),
    );
  }
}

Color colorFromDirection(Direction dir) {
  switch (dir) {
    case Direction.INCOMING:
      return Colors.green;
      break;
    case Direction.OUTGOING:
      return Colors.red;
      break;
    case Direction.SELF:
      return Colors.grey;
      break;
    default:
      return Colors.grey;
  }
}

String textFromDirection(Direction dir) {
  switch (dir) {
    case Direction.INCOMING:
      return "IN";
      break;
    case Direction.OUTGOING:
      return "OUT";
      break;
    case Direction.SELF:
      return "SELF";
      break;
    default:
      return "SELF";
  }
}
