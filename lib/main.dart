import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/screens/homepage.dart';
import 'package:wallet_flutter/utils/constants.dart';
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

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
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
            //primarySwatch: Colors.blue,
            primarySwatch: createMaterialColor(Theme.of(context).masterColor),
            accentColor: Colors.white,
            brightness: Brightness.dark,
            primaryColor: Color(0xff2f3136),
            primaryColorLight: Color(0xff36393f),
            primaryColorDark: Color(0xff292B2F),
          ),
          home: HomePage(),
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
