import 'package:flutter/material.dart';

class SortWidget extends StatelessWidget {
  SortWidget({this.title, this.direction, this.active, this.onTap});

  final String title;
  final bool direction;
  final bool active;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: active ? 1.0 : 0.5,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Row(
            children: <Widget>[
              Text(title),
              Icon(
                active
                    ? direction == true
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down
                    : null,
                size: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
