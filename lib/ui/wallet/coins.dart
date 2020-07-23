import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/utils/fn.dart';
import 'package:wallet_flutter/widgets/sort/sort_store.dart';
import 'package:wallet_flutter/widgets/sort/sortable.dart';
import 'package:wallet_flutter/widgets/sort/sorted_views.dart';

class CoinListView extends StatefulWidget {
  @override
  _CoinListViewState createState() => _CoinListViewState();
}

class _CoinListViewState extends State<CoinListView> {
  SortStore sortStore;
  @override
  void initState() {
    super.initState();

    sortStore = SortStore(
      sortables: ObservableList.of([
        Sortable(
          title: "Coin",
          active: true,
        ),
        Sortable(title: "Amount"),
      ]),
    );
  }

  @override
  Widget build(context) {
    final folderStore = Provider.of<MainStore>(context).folderStore;

    final configStore = Provider.of<MainStore>(context).configStore;
    final balanceStore = Provider.of<MainStore>(context).balanceStore;
    final mainStore = Provider.of<MainStore>(context);

    return Observer(builder: (_) {
      var data = folderStore.ids.map((id) {
        var option = configStore.optionById(id);
        var balance = balanceStore.getBalanceNormalized(option);
        var price = balanceStore.getPrice(option);
        return SortedViewData(
          id: id,
          meta: [
            SortedViewDataMeta(
              title: option.ticker.toUpperCase(),
              subtitle: option.name,
            ),
            SortedViewDataMeta(
              title: valueToPretty(balance.unlocked, CRYPTO_PRECISION),
              subtitle: mainStore.fiat.symbol +
                  "" +
                  valueToPretty(balance.unlocked * price, FIAT_PRECISION),
            ),
          ],
        );
      }).toList();
      return MultiProvider(
        providers: [Provider<SortStore>(create: (_) => sortStore)],
        child: SortedViewTable(
            data: data,
            id: folderStore.id,
            onTap: (d) {
              folderStore.setId(d.id);
            }),
      );
    });
  }
}
