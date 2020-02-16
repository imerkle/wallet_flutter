import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wallet_flutter/models/balance.dart';
import 'package:wallet_flutter/models/transaction.dart' as T;
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/utils/fn.dart';
import 'package:wallet_flutter/widgets/data_table.dart';
import 'package:wallet_flutter/widgets/transaction/tx_iol.dart';
import 'package:wallet_flutter/widgets/transaction/tx_labels.dart';
import '../gen/cargo/protos/coin.pb.dart';
import '../stores/main.dart';
import '../widgets/refresh_footer.dart';

RefreshController _refreshController = RefreshController(initialRefresh: false);

class TrasactionScreen extends StatefulWidget {
  @override
  _TrasactionScreenState createState() => _TrasactionScreenState();
}

class _TrasactionScreenState extends State<TrasactionScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _showModalSheet(T.Transaction tx, Balance b, String base, String rel) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        context: context,
        builder: (builder) {
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
                    TxLabels(
                        label: "Fee",
                        value: valueToPrecision(tx.fees, rel)
                            .toStringAsFixed(CRYPTO_PRECISION)),
                    SizedBox(height: 10),
                    TxIOL(header: "Inputs", iol: tx.inputs, rel: rel),
                    SizedBox(height: 10),
                    TxIOL(header: "Outputs", iol: tx.outputs, rel: rel),
                  ]),
            ),
            padding: EdgeInsets.all(15.0),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final walletStore = Provider.of<MainStore>(context).walletStore;
    final mainStore = Provider.of<MainStore>(context);

    Coins a = mainStore.coinListFromBase;
    Coin x = mainStore.coinFromRel;

    var b = walletStore.bl
        .singleWhere((b) => b.base == a.base)
        .balances
        .singleWhere((b) => b.rel == x.rel);
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: () async {
          await walletStore.refreshTxs(
              base: a.base, rel: x.rel, address: x.address);
          _refreshController.refreshCompleted();
        },
        header: ClassicHeader(),
        footer: RefreshFooter(),
        child: Observer(builder: (_) {
          if (walletStore.txs.length > 0) {
            return MyDataTable(
                columnSpacing: 0,
                columns: [
                  MyDataColumn(label: Text("Txn Hash")),
                  MyDataColumn(label: Text("Age")),
                  MyDataColumn(label: Text("")),
                  MyDataColumn(label: Text("Value")),
                ],
                rows: walletStore.txs.map((tx) {
                  double valueRaw = (tx.inputs.fold(0, (a, y) {
                    return x.address == y.address ? a + y.value : a;
                  }));
                  if (valueRaw == 0) {
                    valueRaw = (tx.outputs.fold(0, (a, y) {
                      return x.address == y.address ? a + y.value : a;
                    }));
                  }
                  double value = valueToPrecision(valueRaw, x.rel);

                  return MyDataRow(
                      cells: [
                        MyDataCell(Text(smartTrim(tx.id, 10))),
                        MyDataCell(Text(timeago.format(
                            DateTime.fromMillisecondsSinceEpoch(
                                tx.timestamp * 1000),
                            maxSuffix: 3))),
                        MyDataCell(Container(
                          padding: EdgeInsets.all(4),
                          color: tx.direction == 0 ? Colors.green : Colors.red,
                          child: Text(tx.direction == 0 ? "IN" : "OUT"),
                        )),
                        MyDataCell(Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(value.toStringAsFixed(CRYPTO_PRECISION) +
                                " " +
                                x.rel.toUpperCase()),
                            Text(
                                walletStore.fiat.symbol +
                                    "" +
                                    (b.fiat * value)
                                        .toStringAsFixed(FIAT_PRECISION),
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        )),
                      ],
                      onSelectChanged: (bool _abc) {
                        print(tx.inputs[0].value);

                        _showModalSheet(tx, b, a.base, x.rel);
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
