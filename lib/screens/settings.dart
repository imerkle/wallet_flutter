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
                    child: Text(entry.value.ticker),
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
  Future<String> _askedToLead(context) async {
    return await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          TextEditingController mnemonic = TextEditingController();
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Restore wallet from Seed",
                  style: Theme.of(context).textTheme.subtitle1),
              SimpleDialog(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        PasteTextField(
                          labelText: "Paste your mnemonic...",
                          controller: mnemonic,
                        ),
                        SimpleButton(
                          onPressed: () {
                            Navigator.pop(context, mnemonic.text);
                          },
                          child: const Text('Restore'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

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
                  String mnemonic = await _askedToLead(context);
                  if (mnemonic.length > 0) {
                    await walletStore.addWallet(mnemonic: mnemonic);
                  }
                },
              ),
            ],
          )
        ],
      );
    });
  }
}
