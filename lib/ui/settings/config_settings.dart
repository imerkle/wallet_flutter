import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/gen/chains/chain/chain.pb.dart';
import 'package:wallet_flutter/gen/pb/config.pb.dart';
import 'package:wallet_flutter/gen/pb/config.pbenum.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/utils/config.dart';
import 'package:wallet_flutter/widgets/common_widgets.dart';
import 'package:wallet_flutter/widgets/select/select_widget.dart';

class LabelField extends StatelessWidget {
  LabelField({
    @required this.label,
    @required this.child,
    this.gap = 0,
  });
  final String label;
  final Widget child;
  final double gap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderGrey1(label),
        SizedBox(height: gap),
        child,
      ],
    );
  }
}

/*
TODO: no mirrors in flutter so just hardcode class fields in Config.toForm/0 method
*/
class ConfigSetting extends StatelessWidget {
  ConfigSetting({
    @required this.option,
    this.isGlobal = false,
  });
  final Option option;
  final bool isGlobal;

  @override
  Widget build(BuildContext context) {
    final configStore = Provider.of<MainStore>(context).configStore;
    final walletStore = Provider.of<MainStore>(context).walletStore;
    var formFields =
        isGlobal ? optionToFormGlobal(option) : optionToForm(option);

    return RoundedContainerDark(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: formFields.map((e) {
                  Widget w = Container();
                  switch (e.kind) {
                    case FormKind.number:
                      if (e.value != 0) {
                        w = LabelField(
                          label: e.label,
                          child: Text(e.value.toString()),
                        );
                      }
                      break;
                    case FormKind.string:
                      if (e.value != "") {
                        w = LabelField(
                          label: e.label,
                          child: Text(e.value),
                        );
                      }
                      break;
                    case FormKind.list:
                      w = LabelField(
                        label: e.label,
                        child: Text(e.value.name),
                      );
                      break;
                  }
                  return w;
                }).toList(),
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                bottomModal(
                  context: context,
                  header: "Modify Config",
                  child: Container(
                    height: MediaQuery.of(context).size.height - 100,
                    padding: EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 15,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: formFields.map((e) {
                                Widget w;
                                switch (e.kind) {
                                  case FormKind.number:
                                    w = LabelField(
                                      label: e.label,
                                      child: NormalTextField(
                                        controller: TextEditingController(
                                            text: e.value.toString()),
                                        onChanged: (text) {
                                          e.value = int.parse(text);
                                        },
                                      ),
                                      gap: 5,
                                    );
                                    break;
                                  case FormKind.string:
                                    w = LabelField(
                                      label: e.label,
                                      child: NormalTextField(
                                        controller: TextEditingController(
                                            text: e.value),
                                        onChanged: (text) {
                                          e.value = text;
                                        },
                                      ),
                                      gap: 5,
                                    );
                                    break;
                                  case FormKind.list:
                                    Widget t;
                                    switch (e.tkind) {
                                      case TKind.protocol:
                                        t = NormalSelect<Protocol>(
                                          childWidget: (x) => Text(x.name),
                                          values: Protocol.values,
                                          index:
                                              Protocol.values.indexOf(e.value),
                                          onChanged: (x) {
                                            e.value = x;
                                          },
                                        );
                                        break;
                                      case TKind.curveName:
                                        t = NormalSelect<CurveName>(
                                          childWidget: (x) => Text(x.name),
                                          values: CurveName.values,
                                          index:
                                              CurveName.values.indexOf(e.value),
                                          onChanged: (x) {
                                            e.value = x;
                                          },
                                        );
                                        break;
                                      case TKind.brkind:
                                        t = NormalSelect<GetBalanceRequestKind>(
                                          childWidget: (x) => Text(x.name),
                                          values: GetBalanceRequestKind.values,
                                          index: GetBalanceRequestKind.values
                                              .indexOf(e.value),
                                          onChanged: (x) {
                                            e.value = x;
                                          },
                                        );
                                        break;
                                      default:
                                        break;
                                    }

                                    w = LabelField(
                                      label: e.label,
                                      child: t,
                                      gap: 5,
                                    );
                                    break;
                                }
                                return w;
                              }).toList()),
                          SizedBox(height: 10),
                          SimpleButton(
                            child: Text("Save"),
                            onPressed: () {
                              updateOptions(option, formFields);
                              if (isGlobal) {
                                configStore.setConfig(option.id, option);
                              } else {
                                walletStore.wallet.options[option.id] = option;
                              }
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
