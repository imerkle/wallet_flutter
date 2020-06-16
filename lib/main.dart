import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/widgets/bottom_nav_bar.dart';
import 'package:wallet_flutter/widgets/fabs.dart';
import 'screens/drawer.dart';
import 'screens/settings.dart';
import 'screens/transactions.dart';
import 'screens/wallet.dart';
import 'screens/web_qr_connect.dart';
import 'stores/main.dart';
import 'utils/app_localization.dart';

void main() => runApp(MyApp());

final mainStore = new MainStore();

final maxSlideDistance = 0.9;
final slideDistancePadding = 0.02;

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
        providers: [Provider<MainStore>(create: (_) => mainStore)],
        child: MaterialApp(
          title: 'Wallet',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            accentColor: Colors.white,
            brightness: Brightness.dark,
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
        ));
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
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();

  List<Widget> leftChilds = <Widget>[
    DrawerScreen(child: FabsScreen()),
    DrawerScreen(child: SettingsList()),
  ];
  List<Widget> middleScreens = <Widget>[
    Wallet(),
    Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    final walletStore = Provider.of<MainStore>(context).walletStore;
    final homepageStore = Provider.of<MainStore>(context).homepageStore;

    return Observer(
      builder: (_) {
        if (walletStore.ws.list.length == 0) {
          return Container();
        }
        Widget middleScreen = Container(
          color: Theme.of(context).primaryColor,
          child: middleScreens.elementAt(homepageStore.pageIndex),
        );
        Widget leftChild = Container(
          color: Theme.of(context).primaryColor,
          child: leftChilds.elementAt(homepageStore.pageIndex),
        );
        Widget rightChild = Container(
          color: Theme.of(context).primaryColor,
          child: TransanctionScreen(),
        );
        if (kIsWeb) {
          return SafeArea(
            child: Scaffold(
              body: Row(
                children: <Widget>[
                  Expanded(
                    flex: 156,
                    child: Column(
                      children: [
                        Expanded(
                          child: leftChild,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 559,
                    child: middleScreen,
                  ),
                  Expanded(
                    flex: 210,
                    child: rightChild,
                  ),
                ],
              ),
            ),
          );
        }
        return SafeArea(
          child: Scaffold(
            body: InnerDrawer(
              onDragUpdate: (value, direction) {
                if (direction == InnerDrawerDirection.start && value > 0.1) {
                  homepageStore.setBottomNavBar(true);
                } else {
                  homepageStore.setBottomNavBar(false);
                }
              },
              key: _innerDrawerKey,
              swipe: true, // default true
              swipeChild: true, // default false

              // DEPRECATED: use offset
              leftOffset: 0.6, // Will be removed in 0.6.0 version
              rightOffset: 0.6, // Will be removed in 0.6.0 version

              //When setting the vertical offset, be sure to use only top or bottom
              offset: IDOffset.only(
                  top: 0,
                  //OR
                  //bottom: 0.5,
                  right: 0.6,
                  left: 0.6),

              proportionalChildArea: true, // default true
              //borderRadius: 50, // default 0
              leftAnimationType: InnerDrawerAnimation.static, // default static
              rightAnimationType: InnerDrawerAnimation.quadratic,
              leftChild: leftChild,
              rightChild: rightChild,
              scaffold: middleScreen,
            ),
            bottomNavigationBar:
                homepageStore.bottomNavBar ? BottomNavBar() : null,
          ),
        );
      },
    );
  }
}
