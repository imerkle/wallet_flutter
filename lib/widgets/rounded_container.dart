import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_flutter/utils/constants.dart';

class RoundedContainer extends StatelessWidget {
  RoundedContainer({this.selected, this.child});
  final bool selected;
  final Widget child;
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
          width: 0,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: selected ? Theme.of(context).primaryColorLighter : null,
      ),
      child: child,
    );
  }
}
