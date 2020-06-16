import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/gen/chains/chain/chain.pbenum.dart';
import 'package:wallet_flutter/gen/pb/config.pb.dart';
import 'package:wallet_flutter/models/config.dart';

// Include generated file
part 'config.g.dart';

// This is the class used by rest of your codebase
class ConfigStore = _ConfigStore with _$ConfigStore;

abstract class _ConfigStore with Store {
  @observable
  Map<String, ConfigAtom> configs = {
    "btc": ConfigAtom(
        id: "btc",
        name: "Bitcoin",
        ticker: "btc",
        brurl: "tbtc1.trezor.io/api/v2",
        brkind: GetBalanceRequestKind.BLOCKBOOK,
        brhash: "",
        precision: 8,
        color: Colors.orange,
        config: Config()
          ..id = "btc"
          ..protocol = Protocol.BTC
          ..code = 1
          ..private = 239
          ..public = 111
          ..prefix = "tb"),
    "eth": ConfigAtom(
        id: "eth",
        name: "Ethereum",
        ticker: "eth",
        brurl: "https://ac-dev0.net:29136/api/v2",
        brkind: GetBalanceRequestKind.ETH_ERC20,
        brhash: "",
        precision: 18,
        color: Colors.blueAccent,
        config: Config()
          ..id = "eth"
          ..protocol = Protocol.ETH
          ..code = 60
          ..chainId = 3),
    "btg": ConfigAtom(
      id: "btg",
      name: "Bitcoin Gold",
      ticker: "btg",
      brurl: "https://btg1.trezor.io/api/v2",
      brkind: GetBalanceRequestKind.BLOCKBOOK,
      brhash: "",
      precision: 8,
      color: Colors.orange,
      config: Config()
        ..id = "btg"
        ..protocol = Protocol.BTC
        ..code = 0
        ..private = 128
        ..public = 38,
    ),
  };

  @observable
  Map<String, List<String>> coinPairs = {
    "btc": ["btc", "btg"],
    "eth": ["eth"],
  };

  @observable
  String base = "btc";
  @observable
  String id = "btc";

  @action
  void setId(String s) {
    id = s;
  }

  @action
  void setBase(String s) {
    base = s;
  }

  @computed
  ConfigAtom get configAtom => configs[id];

  @computed
  List<String> get ids => coinPairs[id];

  ConfigAtom configAtomById(String i) => configs[i];
  bool isCurrentId(int i) => ids[i] == id;

  @computed
  Iterable<Config> get configsForWallet =>
      (Map<String, ConfigAtom>.from(configs)
            ..removeWhere((k, v) => !v.config.hasProtocol()))
          .entries
          .map((entry) => entry.value.config);
}
