import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_flutter/utils/constants.dart';

class CheckboxCard extends StatelessWidget {
  CheckboxCard({this.selected, this.child});
  final bool selected;
  final Widget child;
  @override
  Widget build(context) {
    return Card(
      color: selected ? masterColor : sunkColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(selected ? Icons.check_box : Icons.check_box_outline_blank),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
