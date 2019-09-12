import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/stores/main.dart';

import 'screens/wallet.dart';
import 'widgets/DrawerWidget.dart';

void main() => runApp(EasyLocalization(child: MyApp()));

final mainStore = new MainStore();

final primaryColor = const Color.fromRGBO(32, 34, 37, 1);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    mainStore.initPrep();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    var data = EasyLocalizationProvider.of(context).data;
    return MultiProvider(
      providers: [
        Provider<MainStore>(builder: (_) => mainStore)
      ],
      child:  EasyLocalizationProvider(
        data: data,
        child: MaterialApp(
          title: 'Wallet',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            //primaryColor: primaryColor,
            accentColor: Colors.white,
            brightness: Brightness.dark,
          ),
          home: MyHomePage(title: 'Home'),
          localizationsDelegates: [
            EasylocaLizationDelegate(
              locale: data.locale ?? Locale('en', 'US'),
              path: 'lang'
            ),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
              const Locale('en', 'US'),
              const Locale('sk', 'SK'),
          ],
        ),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Wallet(),
    Text("1"),
    Text("2"),
  ];

  @override
  Widget build(BuildContext context) {
      final walletStore = Provider.of<MainStore>(context).walletStore;
      return Observer(
        builder: (_) {
          if(walletStore.ws.list.length == 0){
            return Container();
          }else{
            return SafeArea(
              child: Scaffold(
                //backgroundColor: Theme.of(context).primaryColor,
                appBar: AppBar(
                  title: Text(widget.title),
                ),
                drawer: Drawer(
                  child: DrawerWidget(),
                ),
                body: _widgetOptions.elementAt(_currentIndex),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  items: [
                    BottomNavigationBarItem(
                      icon: new Icon(Icons.home),
                      title: new Text('Home'),
                    ),
                    BottomNavigationBarItem(
                      icon: new Icon(Icons.settings),
                      title: new Text('Settings'),
                    ),
                    BottomNavigationBarItem(
                      icon: new Icon(Icons.info),
                      title: new Text('About'),
                    ),
                  ],
                  onTap: (int index){
                      setState(() { _currentIndex = index; });
                  },
                )
              ),
            );            
          }
      });
  }
}