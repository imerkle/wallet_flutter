import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/stores/main.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(context) {
    final homepageStore = Provider.of<MainStore>(context).homepageStore;
    return Observer(
      builder: (_) => BottomNavigationBar(
        currentIndex: homepageStore.pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.settings),
            title: new Text('Settings'),
          ),
        ],
        onTap: (int index) {
          homepageStore.setPageIndex(index);
        },
      ),
    );
  }
}
