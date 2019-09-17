import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wallet_flutter/constants.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/widgets/SortWidget.dart';

import 'Fabs.dart';

String getName(String ticker){
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

class DrawerList extends StatelessWidget{

  @override
  Widget build(context){
    final mainStore = Provider.of<MainStore>(context);
    final walletStore = Provider.of<MainStore>(context).walletStore;
    final fabStore = Provider.of<MainStore>(context).fabStore;
    final sortStore = Provider.of<MainStore>(context).sortStore;
    
    return Observer(
      builder: (_) {
        var relIndex = fabStore.relIndex;
        var cl = mainStore.coinListFromBase;
        var coins = cl.list;
        if (sortStore.sortables[0].direction == false){
          coins = coins.reversed.toList();
        }
        return  ListView.builder(
          itemCount: coins.length,
          itemBuilder: (context, i) {
            var b = walletStore.getBalance(rel: coins[i].rel, base: cl.base);
            return Container(
              color: i == relIndex ? Color.fromRGBO(67, 67, 67, 1) : Colors.transparent,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ListTile(
                        title: Text(coins[i].rel.toUpperCase()),
                        subtitle: Text(getName(coins[i].rel)),
                        onTap: () {
                          fabStore.setRelIndex(i);
                        },                
                        selected: i == relIndex,
                      ),
                  ),
                  Expanded(
                    child: ListTile(
                        title: Text(b.balance.toStringAsFixed(CRYPTO_PRECISION)),
                        subtitle: Text("${walletStore.fiat.symbol}${b.fiat.toStringAsFixed(FIAT_PRECISION)}"),
                        onTap: () {
                          fabStore.setRelIndex(i);
                        },                
                        selected: i == relIndex,
                      ),
                  ),
                ],
              ),
            );
          }
        );
      },
    );
  }
}

class DrawerWidget extends StatelessWidget {

  @override
  Widget build(context){

    final walletStore = Provider.of<MainStore>(context).walletStore;
    final fabStore = Provider.of<MainStore>(context).fabStore;
    final sortStore = Provider.of<MainStore>(context).sortStore;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 95,
          child: Row(
            children: <Widget>[
              Container(
                color: Theme.of(context).primaryColor,
                width: iconSize+20,
                child: Fabs(),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      color: Theme.of(context).primaryColor,
                      padding: EdgeInsets.all(20),
                      child: Observer(
                        builder: (_) {
                          return Text(
                            getName(walletStore.ws.list[0].coinsList.list[fabStore.baseIndex].list[0].rel),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                            )
                          );
                        }
                      )
                    ),
                    Observer(
                      builder: (_) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: sortStore.sortables.asMap().map((i, item) => MapEntry(i,
                              Expanded(
                                flex: 1,
                                child: SortWidget(
                                  title: item.title,
                                  direction: item.direction,
                                  active: item.active,
                                  onTap: (){
                                    sortStore.activate(i);
                                  },
                                ),
                              ),
                            ),
                          ).values.toList(),
                        );
                      }
                    ),
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