import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
    final walletStore = Provider.of<MainStore>(context).walletStore;
    final fabStore = Provider.of<MainStore>(context).fabStore;
    final sortStore = Provider.of<MainStore>(context).sortStore;
    
    return Observer(
      builder: (_) {
        var selectedChild = fabStore.selectedChild;
        var selected = fabStore.selected;
        var coin = walletStore.ws.wallets[0].coinsList.coins[selected].coin;
        if (sortStore.sortables[0].direction == false){
          coin = coin.reversed.toList();
        }
        return  ListView.builder(
          itemCount: coin.length,
          itemBuilder: (context, i) {
            return Container(
              color: i == selectedChild ? Color.fromRGBO(67, 67, 67, 1) : Colors.transparent,
              child: ListTile(
                  title: Text(coin[i].rel.toUpperCase()),
                  subtitle: Text(getName(coin[i].rel)),
                  onTap: () {
                    fabStore.setSelectedChild(i);
                  },                
                  selected: i == selectedChild,
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
                            getName(walletStore.ws.wallets[0].coinsList.coins[fabStore.selected].coin[0].rel),
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
        Expanded(
          flex: 5,
          child: Container(
            child: Text("Hello"),
          ),
        ),
      ],
    );
  }
}