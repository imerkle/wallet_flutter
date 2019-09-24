import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/screens/settings.dart';
import 'package:wallet_flutter/screens/wallet.dart';
import 'package:wallet_flutter/screens/web_qr_connect.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/utils/app_localization.dart';
import 'package:wallet_flutter/widgets/drawer_widget.dart';

void main() => runApp(MyApp());

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
    
    return MultiProvider(
      providers: [
        Provider<MainStore>(builder: (_) => mainStore)
      ],
      child: MaterialApp(
          title: 'Wallet',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            //primaryColor: primaryColor,
            accentColor: Colors.white,
            brightness: Brightness.dark
          ),
          home: MyHomePage(),
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
              const Locale('en', 'US'),
              const Locale('sk', 'SK'),
          ],
        )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Wallet(),
    Settings(),
    Text("2"),
  ];

  @override
  Widget build(BuildContext context) {
    final walletStore = Provider.of<MainStore>(context).walletStore;
    return Observer(
      builder: (_){
        if(walletStore.ws.list.length == 0){
          if(kIsWeb){
            return WebQrConnect();
          }else{
            return Container();
          }
        }

        return SafeArea(
          child: Scaffold(
            //backgroundColor: Theme.of(context).primaryColor,
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
      },
    );
  }
}