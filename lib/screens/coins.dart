import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/models/config.dart';
import 'package:wallet_flutter/stores/homepage.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/stores/sort.dart';
import 'package:wallet_flutter/stores/sort/sortable.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/utils/fn.dart';
import 'package:wallet_flutter/widgets/rounded_container.dart';
import 'package:wallet_flutter/widgets/screen_header.dart';
import 'package:wallet_flutter/widgets/sort_widget.dart';

class SortViewButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sortStore = Provider.of<SortStore>(context);

    return Observer(builder: (_) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: sortStore.sortables
              .asMap()
              .map(
                (i, item) => MapEntry(
                  i,
                  Observer(
                    builder: (_) {
                      return SortWidget(
                        title: item.title,
                        active: item.active,
                        direction: item.direction,
                        onTap: () {
                          sortStore.activate(i);
                        },
                      );
                    },
                  ),
                ),
              )
              .values
              .toList());
    });
  }
}

class SortedViewRows extends StatelessWidget {
  SortedViewRows({this.data, this.onTap, this.id});
  final List<SortedViewData> data;
  final Function(SortedViewData) onTap;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) =>
          //if (sortStore.sortables[0].direction == false) {
          // coins = coins.reversed.toList();
          //}
          ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, i) => GestureDetector(
          onTap: () => {onTap(data[i])},
          child: RoundedContainer(
            selected: data[i].id == id,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: data[i]
                  .meta
                  .map((e) => Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e.title),
                            Text(e.subtitle),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class SortedViewTable extends StatelessWidget {
  SortedViewTable({this.onTap, this.data, this.id});
  final Function(SortedViewData) onTap;
  final List<SortedViewData> data;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SortViewButtons(),
      SortedViewRows(onTap: onTap, data: data, id: id),
    ]);
  }
}

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
    final configStore = Provider.of<MainStore>(context).configStore;
    final fabStore = Provider.of<MainStore>(context).fabStore;
    final balanceStore = Provider.of<MainStore>(context).balanceStore;
    final mainStore = Provider.of<MainStore>(context);

    return Observer(builder: (_) {
      var data = fabStore.ids.map((id) {
        var configAtom = configStore.configAtomById(id);
        var balance = balanceStore.getBalanceNormalized(configAtom);
        var price = balanceStore.getPrice(configAtom);
        return SortedViewData(
          id: id,
          meta: [
            SortedViewDataMeta(
              title: configAtom.ticker.toUpperCase(),
              subtitle: configAtom.name,
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
            id: fabStore.id,
            onTap: (d) {
              fabStore.setId(d.id);
            }),
      );
    });
  }
}
