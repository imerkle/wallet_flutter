import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/widgets/common_widgets.dart';
import 'package:wallet_flutter/widgets/sort/sort_store.dart';
import 'package:wallet_flutter/widgets/sort/sort_widget.dart';
import 'package:wallet_flutter/widgets/sort/sortable.dart';

class SortViewButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sortStore = Provider.of<SortStore>(context);

    return Observer(builder: (_) {
      return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: sortStore.sortables
              .asMap()
              .map(
                (i, item) => MapEntry(
                  i,
                  Observer(
                    builder: (_) {
                      return Expanded(
                        child: SortWidget(
                          title: item.title,
                          active: item.active,
                          direction: item.direction,
                          onTap: () {
                            sortStore.activate(i);
                          },
                        ),
                      );
                    },
                  ),
                ),
              )
              .values
              .toList());
    });
  }
}

class SortedViewRows extends StatelessWidget {
  SortedViewRows(
      {@required this.data, @required this.onTap, @required this.id});
  final Function(SortedViewData) onTap;
  final String id;
  final List<SortedViewData> data;
  @override
  Widget build(BuildContext context) {
    final sortStore = Provider.of<SortStore>(context);

    return Observer(
      builder: (_) {
        var dataList = data.toList();
        switch (sortStore.sortable.direction) {
          case SortDirection.asc:
            dataList.sort((a, b) => a.meta[sortStore.index].title
                .compareTo(b.meta[sortStore.index].title));
            break;
          case SortDirection.desc:
            dataList.sort((b, a) => a.meta[sortStore.index].title
                .compareTo(b.meta[sortStore.index].title));
            break;
        }

        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: dataList.length,
          itemBuilder: (context, i) => GestureDetector(
            onTap: () => {onTap(dataList[i])},
            child: RoundedContainer(
              selected: dataList[i].id == id,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: dataList[i]
                      .meta
                      .map((e) => Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(e.title),
                                Text(
                                  e.subtitle,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SortedViewTable extends StatelessWidget {
  SortedViewTable(
      {@required this.data, @required this.onTap, @required this.id});
  final Function(SortedViewData) onTap;
  final String id;
  final List<SortedViewData> data;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SortViewButtons(),
      SizedBox(height: 10),
      SortedViewRows(data: data, onTap: onTap, id: id),
    ]);
  }
}
