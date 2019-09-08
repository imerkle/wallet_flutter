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

class MyHomePage extends StatelessWidget {
  MyHomePage({this.title});

  final String title;

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
                  title: Text(title),
                ),
                drawer: Drawer(
                  child: DrawerWidget(),
                ),
                body: Wallet(),
              ),
            );            
          }
      });
  }
}