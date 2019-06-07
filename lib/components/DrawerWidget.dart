import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:provider/provider.dart';


final double iconSize = 45;

final cryptoColors = {
  'BTC': Colors.orange,
  'ETH': Colors.blueAccent,
  'LTC': Colors.grey,
};
String cryptoIconUrl(String ticker, {int size = 128,String color = "color"}){
  return 'https://raw.githack.com/atomiclabs/cryptocurrency-icons/master/$size/$color/${ticker.toLowerCase()}.png';
}
class Fabs extends StatelessWidget{
  @override
  Widget build(context){
    final coinStore = Provider.of<MainStore>(context).coinStore;
    final fabStore = Provider.of<MainStore>(context).fabStore;
    return ListView.builder(
      itemCount: coinStore.coinbase.length,
      itemBuilder: (context, i) {
        return Observer(
          builder: (_) {
            return 
            GestureDetector(
              onTap: () => fabStore.setSelected(i),
              child: Padding(
                padding: EdgeInsets.only(top: 7, bottom: 7),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: iconSize-0.2*iconSize,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: fabStore.selected == i ? Theme.of(context).accentColor: Colors.transparent,
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
                          color: cryptoColors[coinStore.coinbase[i].ticker],
                          image: DecorationImage(
                            image: NetworkImage(cryptoIconUrl(coinStore.coinbase[i].ticker)),
                            fit: BoxFit.cover
                          ),
                          //shape: BoxShape.circle,
                          borderRadius: BorderRadius.all(Radius.circular(fabStore.selected == i ? 10 : 100)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        );
      }
    );
  }
}
class DrawerList extends StatelessWidget{
  
  @override
  Widget build(context){
    final coinStore = Provider.of<MainStore>(context).coinStore;
    final fabStore = Provider.of<MainStore>(context).fabStore;
    
    return Observer(
      builder: (_) {
        var selectedChild = fabStore.selectedChild;
        var selected = fabStore.selected;
        var coins = coinStore.coinbase[selected].coins;
        return  ListView.builder(
          itemCount: coins.length,
          itemBuilder: (context, i) {
            return Container(
              color: i == selectedChild ? Color.fromRGBO(67, 67, 67, 1) : Colors.transparent,
              child: ListTile(
                  title: Text(coins[i].ticker),
                  subtitle: Text(coins[i].name),
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
class DrawerWidget extends StatelessWidget{
  @override
  Widget build(context){

    final coinStore = Provider.of<MainStore>(context).coinStore;
    final fabStore = Provider.of<MainStore>(context).fabStore;

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
                            coinStore.coinbase[fabStore.selected].coins[0].name,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                            )
                          );
                        }
                      )
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