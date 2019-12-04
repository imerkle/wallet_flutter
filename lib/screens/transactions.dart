import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
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
          print(walletStore.txs);
          List transactions = [];
          return Container(child: Text("woo")
              /*ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, i) {})*/
              );
        }));
  }
}
