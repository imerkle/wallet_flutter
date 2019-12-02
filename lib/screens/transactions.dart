import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/widgets/refresh_footer.dart';

RefreshController _refreshController = RefreshController(initialRefresh: false);

class Trasactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionStore = Provider.of<MainStore>(context).transactionStore;
    final mainStore = Provider.of<MainStore>(context);

    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: () async {
          await transactionStore.refreshBalances();
          _refreshController.refreshCompleted();
        },
        header: ClassicHeader(),
        footer: RefreshFooter(),
        child: Observer(builder: (_) {
          List transactions = [];
          return Container(
              child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, i) {}));
        }));
  }
}
