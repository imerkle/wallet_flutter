import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/stores/coin.dart';
import 'package:wallet_flutter/stores/main.dart';

import 'components/DrawerFabs.dart';

void main() => runApp(MyApp());

final mainStore = new MainStore();

final primaryColor = const Color.fromRGBO(32, 34, 37, 1);
Map<int, Color> color = { 
  50: Color.fromRGBO(42, 44, 49, .1),
  100: Color.fromRGBO(42, 44, 49, .2),
  200: Color.fromRGBO(42, 44, 49, .3),
  300: Color.fromRGBO(42, 44, 49, .4),
  400: Color.fromRGBO(42, 44, 49, .5),
  500: Color.fromRGBO(42, 44, 49, .6),
  600: Color.fromRGBO(42, 44, 49, .7),
  700: Color.fromRGBO(42, 44, 49, .8),
  800: Color.fromRGBO(42, 44, 49, .9),
  900: primaryColor,
};

class MyApp extends StatelessWidget {  
  initialize(){
    mainStore.coinStore.setCoins([
      Coin("BTC", "BTC"),
      Coin("LTC", "BTC"),
      Coin("ETH", "ETH"),
    ]);
  }
  @override
  Widget build(BuildContext context) {
    
    initialize();
    
    return MultiProvider(
      providers: [
        Provider<MainStore>(builder: (_) => mainStore)
      ],
      child:  MaterialApp(
        title: 'Wallet',
        theme: ThemeData(
          primarySwatch: MaterialColor(0xFF2F3136, color),
          primaryColor: primaryColor,
          accentColor: Colors.white,
          brightness: Brightness.dark,
        ),
        home: MyHomePage(title: 'Home'),
      )
    );    
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text(title),
        ),
        drawer: Drawer(
          child: DrawerFabs(),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            ],
          ),
        ),
      ),
    );
  }
}