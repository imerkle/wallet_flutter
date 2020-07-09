import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/screens/coins.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/utils/fn.dart';
import 'package:wallet_flutter/widgets/screen_header.dart';

const double ICON_SIZE = 45;
const double hPad = 10;

class FabsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fabStore = Provider.of<MainStore>(context).fabStore;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Observer(
          builder: (_) => ScreenHeader(
            child: Text(
              fabStore.baseName,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(hPad),
            child: CoinListView(),
          ),
        ),
      ],
    );
  }
}

class Fabs extends StatelessWidget {
  @override
  Widget build(context) {
    final fabStore = Provider.of<MainStore>(context).fabStore;
    final configStore = Provider.of<MainStore>(context).configStore;
    final homepageStore = Provider.of<MainStore>(context).homepageStore;

    var keys = fabStore.coinPairs.keys.toList();
    return Container(
      color: Theme.of(context).primaryColorDarker,
      width: ICON_SIZE + 20,
      child: ListView.builder(
          itemCount: keys.length,
          itemBuilder: (context, i) {
            return Observer(
              builder: (_) => GestureDetector(
                onTap: () {
                  homepageStore.setPageIndex(0);
                  fabStore.base = keys[i];
                },
                child: Tooltip(
                  message: configStore.configAtomById(keys[i]).name,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 7),
                    child: Row(
                      children: <Widget>[
                        FabTip(selected: fabStore.base == keys[i]),
                        FabCircle(
                          selected: fabStore.base == keys[i],
                          color: fabStore.configAtom.color,
                          url: cryptoIconUrl(keys[i]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class FabTip extends StatelessWidget {
  FabTip({this.selected});
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ICON_SIZE - 0.2 * ICON_SIZE,
      decoration: BoxDecoration(
        border: Border.all(
          color: selected ? Theme.of(context).accentColor : Colors.transparent,
          width: 2.0,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

class FabCircle extends StatelessWidget {
  FabCircle({
    this.selected = false,
    this.color = Colors.transparent,
    this.bgcolor,
    @required this.url,
    this.size = ICON_SIZE,
    this.padding = 0.0,
  });
  final bool selected;
  final Color color, bgcolor;
  final String url;
  final double size, padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: bgcolor == null ? Colors.transparent : bgcolor,
        //shape: BoxShape.circle,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: color,
            image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
            //shape: BoxShape.circle,
            borderRadius:
                BorderRadius.all(Radius.circular(selected ? 10 : 100)),
          ),
        ),
      ),
    );
  }
}
