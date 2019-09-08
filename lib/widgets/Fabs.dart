import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/stores/wallet.dart';


final double iconSize = 45;
String cryptoIconUrl(String ticker, {int size = 128,String color = "color"}){
  return 'https://raw.githack.com/atomiclabs/cryptocurrency-icons/master/$size/$color/${ticker.toLowerCase()}.png';
}

final cryptoColors = {
  'btc': Colors.orange,
  'eth': Colors.blueAccent,
  'ltc': Colors.grey,
};

class Fabs extends StatelessWidget{
  @override
  Widget build(context){
    final walletStore = Provider.of<MainStore>(context).walletStore;
    final fabStore = Provider.of<MainStore>(context).fabStore;

    return ListView.builder(
      itemCount: walletStore.ws.list[0].coinsList.list.length,
      itemBuilder: (context, i) {
        return Observer(
          builder: (_) {
            return 
            GestureDetector(
              onTap: () => fabStore.setBaseIndex(i),
              child: Padding(
                padding: EdgeInsets.only(top: 7, bottom: 7),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: iconSize-0.2*iconSize,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: fabStore.baseIndex == i ? Theme.of(context).accentColor: Colors.transparent,
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
                          color: cryptoColors[walletStore.ws.list[0].coinsList.list[i].base],
                          image: DecorationImage(
                            image: NetworkImage(cryptoIconUrl(walletStore.ws.list[0].coinsList.list[i].base)),
                            fit: BoxFit.cover
                          ),
                          //shape: BoxShape.circle,
                          borderRadius: BorderRadius.all(Radius.circular(fabStore.baseIndex == i ? 10 : 100)),
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