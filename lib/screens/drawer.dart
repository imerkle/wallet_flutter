import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/screens/fabs.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/widgets/bottom_nav_bar.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({this.child});
  final Widget child;
  @override
  Widget build(context) {
    final walletStore = Provider.of<MainStore>(context).walletStore;
    final homepageStore = Provider.of<MainStore>(context).homepageStore;

    if (walletStore.ws.list.length == 0) {
      return Container();
    }
    return Row(
      children: <Widget>[
        Fabs(),
        Expanded(
          child: Column(
            children: [
              Expanded(child: child),
              kIsWeb ? BottomNavBar() : Container(),
            ],
          ),
        ),
      ],
    );
  }
}
