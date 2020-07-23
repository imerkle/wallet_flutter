import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/ui/settings/config_settings.dart';
import 'package:wallet_flutter/ui/settings/settings_store.dart';
import 'package:wallet_flutter/widgets/common_widgets.dart';
import 'package:wallet_flutter/widgets/screen_header.dart';
import 'package:direct_select_flutter/direct_select_item.dart';

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
    final folderStore = Provider.of<MainStore>(context).folderStore;
    final configStore = Provider.of<MainStore>(context).configStore;

    return Screen(
      header: "Settings",
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HeaderGrey1("Global Config"),
            SizedBox(height: 10),
            Observer(
              builder: (_) => ConfigSetting(
                option: configStore.options[folderStore.id],
                isGlobal: true,
              ),
            ),
            SizedBox(height: 10),
            HeaderGrey1("Current Config"),
            Observer(
              builder: (_) => ConfigSetting(
                option: configStore.options[folderStore.id],
              ),
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
