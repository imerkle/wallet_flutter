import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/main.dart';
import 'package:provider/provider.dart';

final double iconSize = 45;
String cryptoIconUrl(String ticker, {int size = 128, String color = "color"}) {
  return 'https://raw.githack.com/atomiclabs/cryptocurrency-icons/master/$size/$color/${ticker.toLowerCase()}.png';
}

final cryptoColors = {
  'btc': Colors.orange,
  'eth': Colors.blueAccent,
  'ltc': Colors.grey,
};

class Fabs extends StatelessWidget {
  @override
  Widget build(context) {
    final configStore = Provider.of<MainStore>(context).configStore;
    final balanceStore = Provider.of<MainStore>(context).balanceStore;
    final walletStore = Provider.of<MainStore>(context).walletStore;

    var keys = configStore.coinPairs.keys.toList();
    return ListView.builder(
        itemCount: keys.length,
        itemBuilder: (context, i) {
          return Observer(builder: (_) {
            return GestureDetector(
              onTap: () {
                configStore.setBase(keys[i]);
                configStore.setId(configStore.coinPairs[keys[i]][0]);
                /*
                balanceStore.fetchBalances(
                    configStore.base,
                    configStore.coins[configStore.base],
                    walletStore.ws.list[walletStore.walletIndex].coins.list);
                balanceStore.fetchPrices(configStore.coins[configStore.base]);
                */
              },
              child: Padding(
                padding: EdgeInsets.only(top: 7, bottom: 7),
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
                          color: cryptoColors[keys[i]],
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
            );
          });
        });
  }
}
