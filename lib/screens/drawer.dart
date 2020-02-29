import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/utils/fn.dart';
import '../utils/constants.dart';
import '../stores/main.dart';
import '../widgets/fabs.dart';
import '../widgets/sort_widget.dart';

String getName(String ticker) {
  return cryptoNames[ticker] ?? "Unknown";
}

final cryptoNames = {
  'btc': "Bitcoin",
  'eth': "Ethereum",
  'eos': "EOS",
  'xrp': "Ripple",
  'xlm': "Stellar",
  'neo': "NEO",
  'ont': "Ontology",
};

class DrawerWidget extends StatelessWidget {
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
                          return Text(getName(configStore.rel),
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
    final mainStore = Provider.of<MainStore>(context);
    final balanceStore = Provider.of<MainStore>(context).balanceStore;
    final configStore = Provider.of<MainStore>(context).configStore;
    final sortStore = Provider.of<MainStore>(context).sortStore;

    return Observer(
      builder: (_) {
        var coins = configStore.coins[configStore.base];
        if (sortStore.sortables[0].direction == false) {
          // coins = coins.reversed.toList();
        }
        return ListView.builder(
            itemCount: coins.length,
            itemBuilder: (context, i) {
              var b = balanceStore.getBalance(
                  rel: coins[i], base: configStore.base);
              return Container(
                color: coins[i] == configStore.rel
                    ? Color.fromRGBO(67, 67, 67, 1)
                    : Colors.transparent,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(coins[i].toUpperCase()),
                        subtitle: Text(getName(coins[i])),
                        onTap: () {
                          configStore.setRel(coins[i]);
                        },
                        selected: coins[i] == configStore.rel,
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(valueToPretty(b.value, CRYPTO_PRECISION)),
                        subtitle: Text(
                            "${balanceStore.fiat.symbol}${valueToPretty(b.value * b.price, FIAT_PRECISION)}"),
                        onTap: () {
                          configStore.setRel(coins[i]);
                        },
                        selected: coins[i] == configStore.rel,
                      ),
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}
