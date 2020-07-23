import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/ui/folders/folders.dart';
import 'package:wallet_flutter/ui/settings/settings.dart';
import 'package:wallet_flutter/ui/transaction/transactions.dart';
import 'package:wallet_flutter/widgets/bottom_nav_bar.dart';

enum DrawerPosition {
  left,
  right,
}

class DrawerScreen extends StatelessWidget {
  DrawerScreen({@required this.child, @required this.position});
  final Widget child;
  final DrawerPosition position;
  @override
  Widget build(context) {
    final walletStore = Provider.of<MainStore>(context).walletStore;

    if (walletStore.ws.list.length == 0) {
      return Container();
    }
    return Row(
      children: <Widget>[
        position == DrawerPosition.left ? Fabs() : Container(),
        Expanded(
          child: Column(
            children: [
              Expanded(child: child),
              kIsWeb && position == DrawerPosition.left
                  ? BottomNavBarLeft()
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}

class WalletRightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          Expanded(
            child: TabBarView(
              children: [
                TransactionScreen(),
                CoinSettingScreen(),
              ],
            ),
          ),
          TabBar(
            tabs: [
              Tab(icon: Icon(Icons.transfer_within_a_station)),
              Tab(icon: Icon(Icons.settings_applications)),
            ],
          ),
        ],
      ),
    );
  }
}
