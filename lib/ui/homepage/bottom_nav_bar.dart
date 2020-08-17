import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/stores/main.dart';

class BottomNavBarLeft extends StatelessWidget {
  @override
  Widget build(context) {
    final homepageStore = Provider.of<MainStore>(context).homepageStore;
    return Observer(
      builder: (_) => BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        currentIndex: homepageStore.pageIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Tooltip(
              message: "Home",
              child: Icon(Icons.home),
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Tooltip(
              message: "Settings",
              child: Icon(Icons.settings),
            ),
            title: Text('Settings'),
          ),
        ],
        onTap: (int index) {
          homepageStore.setPageIndex(index);
        },
      ),
    );
  }
}
