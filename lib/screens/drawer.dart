import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/utils/fn.dart';
import '../utils/constants.dart';
import '../stores/main.dart';
import '../widgets/fabs.dart';
import '../widgets/sort_widget.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(context) {
    final walletStore = Provider.of<MainStore>(context).walletStore;
    final configStore = Provider.of<MainStore>(context).configStore;
    final sortStore = Provider.of<MainStore>(context).sortStore;

    if (walletStore.ws.list.length == 0) {
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 95,
          child: Row(
            children: <Widget>[
              Container(
                color: Theme.of(context).primaryColor,
                width: iconSize + 20,
                child: Fabs(),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                        color: Theme.of(context).primaryColor,
                        padding: EdgeInsets.all(20),
                        child: Observer(builder: (_) {
                          return Text(configStore.configAtom.name,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20,
                              ));
                        })),
                    Observer(builder: (_) {
                      return Row(
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
                      );
                    }),
                    Expanded(child: DrawerList()),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class DrawerList extends StatelessWidget {
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
              return Container(
                color: configStore.isCurrentId(i)
                    ? Color.fromRGBO(67, 67, 67, 1)
                    : Colors.transparent,
                child: Row(
                  children: <Widget>[
                    DrawerListRow(
                        title: configAtom.ticker.toUpperCase(),
                        subtitle: configAtom.name,
                        onTap: () {
                          configStore.setId(id);
                        },
                        configStoreId: configStore.id),
                    DrawerListRow(
                        title:
                            valueToPretty(balance.unlocked, CRYPTO_PRECISION),
                        subtitle:
                            "${mainStore.fiat.symbol}${valueToPretty(balance.unlocked * price, FIAT_PRECISION)}",
                        onTap: () {
                          configStore.setId(id);
                        },
                        configStoreId: configStore.id),
                  ],
                ),
              );
            });
      },
    );
  }
}

class DrawerListRow extends StatelessWidget {
  DrawerListRow(
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
