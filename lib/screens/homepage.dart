import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/screens/drawer.dart';
import 'package:wallet_flutter/screens/fabs.dart';
import 'package:wallet_flutter/screens/settings.dart';
import 'package:wallet_flutter/screens/transactions.dart';
import 'package:wallet_flutter/screens/wallet.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/widgets/bottom_nav_bar.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();

  final List<Widget> leftChilds = <Widget>[
    DrawerScreen(
      child: FabsScreen(),
      position: DrawerPosition.left,
    ),
    DrawerScreen(
      child: SettingsList(),
      position: DrawerPosition.left,
    ),
  ];
  final List<Widget> middleScreens = <Widget>[
    Wallet(),
    Settings(),
  ];
  final List<Widget> rightChilds = <Widget>[
    DrawerScreen(
      child: WalletRightScreen(),
      position: DrawerPosition.right,
    ),
    Container(),
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
          color: Theme.of(context).primaryColorLight,
          child: middleScreens.elementAt(homepageStore.pageIndex),
        );
        Widget leftChild = Container(
          color: Theme.of(context).primaryColor,
          child: leftChilds.elementAt(homepageStore.pageIndex),
        );
        Widget rightChild = Container(
          color: Theme.of(context).primaryColor,
          child: rightChilds.elementAt(homepageStore.pageIndex),
        );
        if (kIsWeb) {
          return SafeArea(
            child: Scaffold(
              body: Row(
                children: <Widget>[
                  Container(
                    width: 300,
                    child: Column(
                      children: [
                        Expanded(
                          child: leftChild,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: middleScreen,
                  ),
                  Container(
                    width: 400,
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
                homepageStore.bottomNavBar ? BottomNavBarLeft() : null,
          ),
        );
      },
    );
  }
}
