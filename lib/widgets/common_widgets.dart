import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/utils/fn.dart';

class RoundedContainerDark extends StatelessWidget {
  RoundedContainerDark({
    @required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      selected: true,
      child: child,
      color: Theme.of(context).primaryColorDark,
      border: Border.all(
        color: Colors.black87,
        width: 1,
      ),
    );
  }
}

class RoundedContainer extends StatelessWidget {
  RoundedContainer({
    this.selected = false,
    this.color,
    @required this.child,
    this.padding = 0,
    this.border,
  });
  final bool selected;
  final Widget child;
  final Color color;
  final double padding;
  final Border border;
  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        border: border == null
            ? Border.all(
                color: selected
                    ? Theme.of(context).primaryColorLighter30
                    : Colors.transparent,
                width: 1,
              )
            : border,
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: selected
            ? color == null ? Theme.of(context).primaryColorLighter : color
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: child,
      ),
    );
  }
}

class RadioCard extends StatelessWidget {
  RadioCard({
    @required this.index,
    @required this.data,
    this.onChanged,
    this.onDismissed,
  });
  final int index;
  final List<Widget> data;
  final void Function(int) onChanged;
  final void Function(int) onDismissed;
  @override
  Widget build(context) {
    return Column(
        children: data
            .asMap()
            .entries
            .map(
              (entry) => NormalDismissible(
                onDismissed: (_) {
                  onDismissed(entry.key);
                },
                child: GestureDetector(
                  onTap: () => {onChanged(entry.key)},
                  child: Container(
                    margin: const EdgeInsets.all(6),
                    child: CheckboxCard(
                      selected: index == entry.key,
                      child: entry.value,
                    ),
                  ),
                ),
              ),
            )
            .toList());
  }
}

class NormalDismissible extends StatelessWidget {
  NormalDismissible({@required this.onDismissed, @required this.child});
  final Function(DismissDirection) onDismissed;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Align(
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: onDismissed,
      key: UniqueKey(),
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm"),
              content: const Text("Are you sure you wish to delete this item?"),
              actions: <Widget>[
                FlatButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text("DELETE")),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("CANCEL"),
                ),
              ],
            );
          },
        );
      },
      child: child,
    );
  }
}

class CheckboxCard extends StatelessWidget {
  CheckboxCard({this.selected, this.child});
  final bool selected;
  final Widget child;
  @override
  Widget build(context) {
    return RoundedContainer(
      border: Border.all(
        color: selected
            ? Theme.of(context).masterColor30
            : Theme.of(context).primaryColorDarker,
        width: 1,
      ),
      selected: true,
      color: selected
          ? Theme.of(context).masterColor
          : Theme.of(context).primaryColorDark,
      child: ListTile(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: Icon(
                  selected ? Icons.check_box : Icons.check_box_outline_blank),
            ),
            Expanded(
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}

class TextIconButton extends StatelessWidget {
  TextIconButton({this.onPressed, this.title, this.icon});
  final void Function() onPressed;
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(3),
      onPressed: onPressed,
      child: Column(
        children: [
          icon,
          Text(title, style: Theme.of(context).textTheme.caption),
        ],
      ),
    );
  }
}

class PasteTextField extends StatelessWidget {
  PasteTextField({
    this.controller,
    @required this.labelText,
  });
  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return NormalTextField(
      controller: controller,
      labelText: labelText,
      suffixIcon: IconButton(
        icon: Icon(Icons.content_paste),
        onPressed: () {
          writePaste(controller);
        },
      ),
    );
  }
}

class ScanTextField extends StatelessWidget {
  ScanTextField({this.controller, this.onScan});

  final TextEditingController controller;
  final Function onScan;

  @override
  Widget build(BuildContext context) {
    return NormalTextField(
      controller: controller,
      labelText: 'Recieving Address',
      prefixIcon: IconButton(
        icon: Icon(MaterialCommunityIcons.qrcode_scan),
        onPressed: () {
          scan(onScan);
        },
      ),
      suffixIcon: IconButton(
        icon: Icon(Icons.content_paste),
        onPressed: () {
          writePaste(controller);
        },
      ),
    );
  }
}

class NormalTextField extends StatelessWidget {
  NormalTextField({
    @required this.controller,
    this.labelText = "",
    this.prefixIcon,
    this.suffixIcon,
    this.floatingLabelBehavior = FloatingLabelBehavior.never,
  });

  final TextEditingController controller;
  final String labelText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final FloatingLabelBehavior floatingLabelBehavior;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 14.0,
      ),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: labelText,
        floatingLabelBehavior: floatingLabelBehavior,
        filled: true,
        fillColor: Theme.of(context).primaryColorDark,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColorDarker30,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).masterColor,
          ),
        ),
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

class SimpleButton extends FlatButton {
  SimpleButton({
    @required this.onPressed,
    @required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Theme.of(context).buttonColor,
      onPressed: onPressed,
      padding: EdgeInsets.all(3),
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(3),
      ),
      child: child,
    );
  }
}

Future<T> bottomModal<T>(
    {BuildContext context, String header, Widget child}) async {
  return await showModalBottomSheet<T>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  color: Theme.of(context).primaryColorDarker,
                  child: Text(
                    header.toUpperCase(),
                    style: Theme.of(context).textTheme.headerGrey4,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: child,
                ),
              ],
            ),
          ],
        );
      });
}

class HeaderGrey1 extends StatelessWidget {
  HeaderGrey1(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headerGrey1,
    );
  }
}
