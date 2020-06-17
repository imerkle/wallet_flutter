import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  ScreenHeader({this.child});
  final Widget child;
  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 48,
      decoration: BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(color: Theme.of(context).primaryColorDark),
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: child,
      ),
    );
  }
}

class Screen extends StatelessWidget {
  Screen({this.child, this.header, this.style});
  final Widget child;
  final String header;
  final TextStyle style;
  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ScreenHeader(
          child: Text(
            header,
            style:
                style != null ? style : Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(child: child)
      ],
    );
  }
}
