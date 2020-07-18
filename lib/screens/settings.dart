import 'package:direct_select_flutter/direct_select_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/gen/pb/config.pbenum.dart';
import 'package:wallet_flutter/models/config.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/stores/settings.dart';
import 'package:wallet_flutter/widgets/common_widgets.dart';
import 'package:wallet_flutter/widgets/screen_header.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:direct_select_flutter/direct_select_list.dart';
import 'package:direct_select_flutter/direct_select_item.dart';
import 'package:wallet_flutter/widgets/select_widget.dart';

DirectSelectItem<String> getDropDownMenuItem(String value) {
  return DirectSelectItem<String>(
      itemHeight: 56,
      value: value,
      itemBuilder: (context, value) {
        return Text(value);
      });
}

_getDslDecoration() {
  return BoxDecoration(
    border: BorderDirectional(
      bottom: BorderSide(width: 1, color: Colors.black12),
      top: BorderSide(width: 1, color: Colors.black12),
    ),
  );
}

Map<SettingsEnum, String> settings = {
  SettingsEnum.wallet: "Wallets",
  SettingsEnum.config: "Configs",
};

class SettingsList extends StatelessWidget {
  @override
  Widget build(context) {
    final settingsStore = Provider.of<MainStore>(context).settingsStore;

    return Screen(
      header: "Settings",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Observer(
          builder: (_) => ListView(
            children: settings.entries
                .map(
                  (entry) => RoundedContainer(
                    selected: settingsStore.settingsEnum == entry.key,
                    child: ListTile(
                      title: Text(entry.value),
                      onTap: () {
                        settingsStore.setSettingsEnum(entry.key);
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(context) {
    final settingsStore = Provider.of<MainStore>(context).settingsStore;
    Widget widget;
    String header;

    return Observer(builder: (_) {
      switch (settingsStore.settingsEnum) {
        case SettingsEnum.wallet:
          widget = WalletSetting();
          header = "Wallets";
          break;
        case SettingsEnum.config:
          //widget = ConfigSetting();
          //header = "Default Configuration";
          break;
      }
      return Screen(
        header: header,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: widget,
        ),
      );
    });
  }
}

class WalletSetting extends StatelessWidget {
  @override
  Widget build(context) {
    final walletStore = Provider.of<MainStore>(context).walletStore;
    return Observer(builder: (_) {
      return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: RadioCard(
                onDismissed: (index) {
                  walletStore.removeWallet(index);
                },
                onChanged: (i) {
                  walletStore.index = i;
                },
                index: walletStore.index,
                data: walletStore.ws.list
                    .asMap()
                    .entries
                    .map(
                      (entry) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Wallet ${entry.key}"),
                          Text(
                            entry.value.walletKind.name,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          Wrap(
            spacing: 20,
            children: [
              TextIconButton(
                icon: Icon(Icons.add_box),
                title: "Create Wallet",
                onPressed: () async {
                  await walletStore.addWallet();
                },
              ),
              TextIconButton(
                icon: Icon(Icons.settings_backup_restore),
                title: "Restore Wallet",
                onPressed: () async {
                  TextEditingController mnemonic = TextEditingController();
                  bottomModal(
                    context: context,
                    header: "Restore wallet from Seed",
                    child: Column(
                      children: [
                        PasteTextField(
                          labelText: "Paste your mnemonic...",
                          controller: mnemonic,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SimpleButton(
                          onPressed: () async {
                            if (mnemonic.text.length > 0) {
                              await walletStore.addWallet(
                                  mnemonic: mnemonic.text);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text('Restore'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          )
        ],
      );
    });
  }
}

class CoinSettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fabStore = Provider.of<MainStore>(context).fabStore;
    final configStore = Provider.of<MainStore>(context).configStore;

    return Screen(
      header: "Settings",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HeaderGrey1("Current Config"),
            SizedBox(height: 10),
            Observer(
              builder: (_) =>
                  ConfigSetting(configAtom: configStore.configs[fabStore.id]),
            ),
            /*
            SizedBox(height: 10),
            HeaderGrey1("Default Config"),
            SizedBox(height: 10),
            ConfigSetting(),
            */
          ],
        ),
      ),
    );
  }
}

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

class ConfigSetting extends StatelessWidget {
  ConfigSetting({this.configAtom});
  final ConfigAtom configAtom;

  @override
  Widget build(BuildContext context) {
    final configStore = Provider.of<MainStore>(context).configStore;
    final fabStore = Provider.of<MainStore>(context).fabStore;

    return RoundedContainerDark(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelField(
                    label: "Ticker",
                    child: Text(configAtom.ticker),
                  ),
                  LabelField(
                    label: "Precision",
                    child: Text(configAtom.precision.toString()),
                  ),
                  LabelField(
                    label: "Protocol",
                    child: Text(configAtom.config.protocol.name),
                  ),
                  LabelField(
                    label: "Code",
                    child: Text(configAtom.config.code.toString()),
                  ),
                  LabelField(
                    label: "Curve Name",
                    child: Text(configAtom.config.curveName.name),
                  ),
                  LabelField(
                    label: "Private",
                    child: Text(configAtom.config.private.toString()),
                  ),
                  LabelField(
                    label: "Public",
                    child: Text(configAtom.config.public.toString()),
                  ),
                  LabelField(
                    label: "Chain Id",
                    child: Text(configAtom.config.chainId.toString()),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                var tC = TextEditingController(text: configAtom.ticker);
                var cC = TextEditingController(
                    text: configAtom.config.code.toString());
                var pvC = TextEditingController(
                    text: configAtom.config.private.toString());
                var pbC = TextEditingController(
                    text: configAtom.config.public.toString());
                var pC = TextEditingController(
                    text: configAtom.precision.toString());

                bottomModal(
                  context: context,
                  header: "Modify Config",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      LabelField(
                        label: "Ticker",
                        child: NormalTextField(controller: tC),
                        gap: 5,
                      ),
                      SizedBox(height: 10),
                      LabelField(
                        label: "Precision",
                        child: NormalTextField(controller: pC),
                        gap: 5,
                      ),
                      SizedBox(height: 10),
                      LabelField(
                        label: "Code",
                        child: NormalTextField(controller: cC),
                        gap: 5,
                      ),
                      SizedBox(height: 10),
                      LabelField(
                        label: "Protocol",
                        child: RoundedContainerDark(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Observer(
                              builder: (_) => NormalSelect<Protocol>(
                                childWidget: (x) => Text(x.name),
                                values: Protocol.values,
                                index: Protocol.values
                                    .indexOf(configAtom.config.protocol),
                                onChanged: (x) {
                                  configAtom.config.protocol = x;
                                },
                              ),
                            ),
                          ),
                        ),
                        gap: 5,
                      ),
                      LabelField(
                        label: "Private",
                        child: NormalTextField(controller: pvC),
                        gap: 5,
                      ),
                      SizedBox(height: 10),
                      LabelField(
                        label: "Public",
                        child: NormalTextField(controller: pbC),
                        gap: 5,
                      ),
                      SizedBox(height: 10),
                      SimpleButton(
                        child: Text("Save"),
                        onPressed: () {
                          configAtom.ticker = tC.text;
                          configAtom.precision = int.parse(pC.text);
                          configAtom.config.code = int.parse(cC.text);
                          configStore.setConfig(fabStore.id, configAtom);
                          Navigator.pop(context);
                        },
                      )
                    ],
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
