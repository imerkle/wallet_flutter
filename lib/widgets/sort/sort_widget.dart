import 'package:flutter/material.dart';
import 'package:wallet_flutter/widgets/common_widgets.dart';
import 'package:wallet_flutter/widgets/sort/sortable.dart';

class SortWidget extends StatelessWidget {
  const SortWidget(
      {@required this.title,
      this.active = false,
      this.direction = SortDirection.asc,
      this.onTap});

  final String title;
  final bool active;
  final SortDirection direction;

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: RoundedContainer(
        selected: active,
        color: Colors.transparent,
        child: Opacity(
          opacity: active ? 1.0 : 0.5,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: <Widget>[
                Text(title),
                Icon(
                  active
                      ? direction == SortDirection.asc
                          ? Icons.arrow_drop_up
                          : Icons.arrow_drop_down
                      : null,
                  size: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
