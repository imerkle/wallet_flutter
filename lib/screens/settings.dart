import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:wallet_flutter/stores/main.dart';
import 'package:wallet_flutter/stores/settings.dart';
import 'package:wallet_flutter/utils/constants.dart';
import 'package:wallet_flutter/widgets/checkbox_card.dart';
import 'package:wallet_flutter/widgets/rounded_container.dart';

Map<SettingsEnum, String> settings = {
  SettingsEnum.wallet: "Wallets",
  SettingsEnum.connection: "Connection",
};

class SettingsList extends StatelessWidget {
  @override
  Widget build(context) {
    final settingsStore = Provider.of<MainStore>(context).settingsStore;

    return Observer(builder: (_) {
      return ListView(
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
      );
    });
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(context) {
    final settingsStore = Provider.of<MainStore>(context).settingsStore;
    Widget widget;
    switch (settingsStore.settingsEnum) {
      case SettingsEnum.wallet:
        widget = WalletSetting();
        break;
    }
    return Container(
      margin: EdgeInsets.all(10),
      child: widget,
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
            child: ListView(
                children: walletStore.ws.list
                    .asMap()
                    .entries
                    .map(
                      (entry) => CheckboxCard(
                        selected: walletStore.index == entry.key,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Wallet ${entry.key}"),
                            Text(entry.value.mnemonic),
                          ],
                        ),
                      ),
                    )
                    .toList()),
          ),
          IconButton(
            icon: Icon(Icons.add_box),
            onPressed: () async {
              await walletStore.addWallet();
              print("done");
            },
          ),
        ],
      );
    });

    //return Container();
  }
}
