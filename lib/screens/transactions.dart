import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wallet_flutter/utils/constants.dart';
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

  @override
  Widget build(BuildContext context) {
    final walletStore = Provider.of<MainStore>(context).walletStore;
    final mainStore = Provider.of<MainStore>(context);

    Coins a = mainStore.coinListFromBase;
    Coin x = mainStore.coinFromRel;

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
          print(walletStore.txs.length);
          if (walletStore.txs.length > 0) {
            return DataTable(
                columns: [
                  DataColumn(label: Text("Txn Hash")),
                  DataColumn(label: Text("Age")),
                  DataColumn(label: Text("")),
                  DataColumn(label: Text("Value")),
                ],
                rows: walletStore.txs
                    .map((tx) => DataRow(cells: [
                          DataCell(Text(smartTrim(tx.id, 10))),
                          DataCell(Text(timeago.format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  tx.timestamp * 1000),
                              maxSuffix: 3))),
                          DataCell(Container(
                            padding: EdgeInsets.all(6),
                            color:
                                tx.direction == 0 ? Colors.green : Colors.red,
                            child: Text(tx.direction == 0 ? "IN" : "OUT"),
                          )),
                          DataCell(Text(
                              ((tx.inputs.fold(0, (a, x) => a + x.value)) /
                                          pow(10, precisions[x.rel]))
                                      .toString() +
                                  " " +
                                  x.rel.toUpperCase())),
                        ]))
                    .toList());
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
