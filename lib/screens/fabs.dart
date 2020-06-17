import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/stores/homepage.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/utils/fn.dart';
import 'package:wallet_flutter/widgets/rounded_container.dart';
import 'package:wallet_flutter/widgets/screen_header.dart';
import 'package:wallet_flutter/widgets/sort_widget.dart';

final double iconSize = 45;
const double hPad = 10;

String cryptoIconUrl(String ticker, {int size = 128, String color = "color"}) {
  return 'https://raw.githack.com/atomiclabs/cryptocurrency-icons/master/$size/$color/${ticker.toLowerCase()}.png';
}

class FabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final configStore = Provider.of<MainStore>(context).configStore;
    final sortStore = Provider.of<MainStore>(context).sortStore;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Observer(
          builder: (_) => ScreenHeader(
            child: Text(
              configStore.baseName,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: hPad),
          child: Observer(
            builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: sortStore.sortables
                  .asMap()
                  .map(
                    (i, item) => MapEntry(
                      i,
                      Expanded(
                        flex: 1,
                        child: SortWidget(
                          title: item.title,
                          direction: item.direction,
                          active: item.active,
                          onTap: () {
                            sortStore.activate(i);
                          },
                        ),
                      ),
                    ),
                  )
                  .values
                  .toList(),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(hPad),
            child: FabsList(),
          ),
        ),
      ],
    );
  }
}

class Fabs extends StatelessWidget {
  @override
  Widget build(context) {
    final configStore = Provider.of<MainStore>(context).configStore;
    final homepageStore = Provider.of<MainStore>(context).homepageStore;

    var keys = configStore.coinPairs.keys.toList();
    return Container(
      color: Theme.of(context).primaryColorDarker,
      width: iconSize + 20,
      child: ListView.builder(
          itemCount: keys.length,
          itemBuilder: (context, i) {
            return Observer(builder: (_) {
              return GestureDetector(
                onTap: () {
                  homepageStore.setPageIndex(0);
                  configStore.setBase(keys[i]);
                  configStore.setId(configStore.coinPairs[keys[i]][0]);
                },
                child: Tooltip(
                  message: configStore.configAtomById(keys[i]).name,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: iconSize - 0.2 * iconSize,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: configStore.base == keys[i]
                                  ? Theme.of(context).accentColor
                                  : Colors.transparent,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Container(
                            height: iconSize,
                            width: iconSize,
                            decoration: BoxDecoration(
                              color: configStore.configAtom.color,
                              image: DecorationImage(
                                  image: NetworkImage(cryptoIconUrl(keys[i])),
                                  fit: BoxFit.cover),
                              //shape: BoxShape.circle,
                              borderRadius: BorderRadius.all(Radius.circular(
                                  configStore.base == keys[i] ? 10 : 100)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
          }),
    );
  }
}

class FabsList extends StatelessWidget {
  @override
  Widget build(context) {
    final balanceStore = Provider.of<MainStore>(context).balanceStore;
    final configStore = Provider.of<MainStore>(context).configStore;
    final sortStore = Provider.of<MainStore>(context).sortStore;
    final mainStore = Provider.of<MainStore>(context);

    return Observer(
      builder: (_) {
        if (sortStore.sortables[0].direction == false) {
          // coins = coins.reversed.toList();
        }
        return ListView.builder(
            itemCount: configStore.ids.length,
            itemBuilder: (context, i) {
              var id = configStore.ids[i];
              var configAtom = configStore.configAtomById(id);
              var balance = balanceStore.getBalanceNormalized(configAtom);
              var price = balanceStore.getPrice(configAtom);
              return RoundedContainer(
                selected: configStore.id == id,
                child: Row(
                  children: <Widget>[
                    FabsListRow(
                      title: configAtom.ticker.toUpperCase(),
                      subtitle: configAtom.name,
                      onTap: () {
                        configStore.setId(id);
                      },
                      configStoreId: configStore.id,
                    ),
                    FabsListRow(
                      title: valueToPretty(balance.unlocked, CRYPTO_PRECISION),
                      subtitle:
                          "${mainStore.fiat.symbol}${valueToPretty(balance.unlocked * price, FIAT_PRECISION)}",
                      onTap: () {
                        configStore.setId(id);
                      },
                      configStoreId: configStore.id,
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}

class FabsListRow extends StatelessWidget {
  FabsListRow(
      {this.title, this.subtitle, this.id, this.onTap, this.configStoreId});
  final String title, subtitle, id, configStoreId;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: onTap,
        selected: id == configStoreId,
      ),
    );
  }
}
