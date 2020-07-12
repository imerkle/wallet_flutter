import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/stores/settings.dart';
import 'package:wallet_flutter/widgets/common_widgets.dart';
import 'package:wallet_flutter/widgets/screen_header.dart';
import 'package:wallet_flutter/utils/constants.dart';

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
          widget = ConfigSetting();
          header = "Default Configuration";
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

class ConfigLabel extends StatelessWidget {
  ConfigLabel({this.label, this.value});
  final String value, label;
  @override
  Widget build(BuildContext context) {
    if (value == "0" || value == "") {
      return Container();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderGrey1(label),
        Text(value),
      ],
    );
  }
}

class ConfigSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final configStore = Provider.of<MainStore>(context).configStore;
    return Observer(
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: configStore.configs.entries
            .map(
              (entry) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedContainerDark(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ConfigLabel(
                                label: "Ticker",
                                value: entry.value.ticker,
                              ),
                              ConfigLabel(
                                label: "Precision",
                                value: entry.value.precision.toString(),
                              ),
                              ConfigLabel(
                                label: "Protocol",
                                value: entry.value.config.protocol.name,
                              ),
                              ConfigLabel(
                                label: "Code",
                                value: entry.value.config.code.toString(),
                              ),
                              ConfigLabel(
                                label: "Curve Name",
                                value: entry.value.config.curveName.name,
                              ),
                              ConfigLabel(
                                label: "Private",
                                value: entry.value.config.private.toString(),
                              ),
                              ConfigLabel(
                                label: "Public",
                                value: entry.value.config.public.toString(),
                              ),
                              ConfigLabel(
                                label: "Chain Id",
                                value: entry.value.config.chainId.toString(),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
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
                onDismiss: (index) {
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
