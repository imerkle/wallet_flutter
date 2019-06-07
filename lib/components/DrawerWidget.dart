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
class Fabs extends StatelessWidget{
  @override
  Widget build(context){
    final coinStore = Provider.of<MainStore>(context).coinStore;
    final fabStore = Provider.of<MainStore>(context).fabStore;
    return ListView(
      children: List.generate(coinStore.coins.length, (i) => 
        Observer(
          builder: (_) {
            return 
            GestureDetector(
              onTap: () => fabStore.setSelected(i+1),
              child: Padding(
                padding: EdgeInsets.only(top: 7, bottom: 7),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: iconSize-0.2*iconSize,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: fabStore.selected == i+1 ? Theme.of(context).accentColor: Colors.transparent,
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
                          color: cryptoColors[coinStore.coins[i].rel],
                          image: DecorationImage(
                            image: NetworkImage('https://raw.githack.com/atomiclabs/cryptocurrency-icons/master/128/color/${coinStore.coins[i].rel.toLowerCase()}.png'),
                            fit: BoxFit.cover
                          ),
                          //shape: BoxShape.circle,
                          borderRadius: BorderRadius.all(Radius.circular(fabStore.selected == i+1 ? 10 : 100)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      )
    );
  }
}
class DrawerWidget extends StatelessWidget{
  @override
  Widget build(context){
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
                child: Text("hello"),
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