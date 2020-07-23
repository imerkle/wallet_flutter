import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/gen/chains/chain/chain.pbenum.dart';
import 'package:wallet_flutter/gen/pb/config.pb.dart';

// Include generated file
part 'config.g.dart';

// This is the class used by rest of your codebase
class ConfigStore = _ConfigStore with _$ConfigStore;

abstract class _ConfigStore with Store {
  @observable
  ObservableMap<String, Option> options = ObservableMap.of({
    "btc": Option()
      ..id = "btc"
      ..name = "Bitcoin"
      ..ticker = "btc"
      ..brurl = "tbtc1.trezor.io/api/v2"
      ..brkind = GetBalanceRequestKind.BLOCKBOOK
      ..brhash = ""
      ..precision = 8
      ..config = (Config()
        ..id = "btc"
        ..protocol = Protocol.BTC
        ..code = 1
        ..private = 239
        ..public = 111
        ..prefix = "tb"),
    "eth": Option()
      ..id = "eth"
      ..name = "Ethereum"
      ..ticker = "eth"
      ..brurl = "ac-dev0.net:29136/api/v2"
      ..brkind = GetBalanceRequestKind.ETH_ERC20
      ..brhash = ""
      ..precision = 18
      ..config = (Config()
        ..id = "eth"
        ..protocol = Protocol.ETH
        ..code = 60
        ..chainId = 3),
    "btg": Option()
      ..id = "btg"
      ..name = "Bitcoin Gold"
      ..ticker = "btg"
      ..brurl = "btg1.trezor.io/api/v2"
      ..brkind = GetBalanceRequestKind.BLOCKBOOK
      ..brhash = ""
      ..precision = 8
      ..config = (Config()
        ..id = "btg"
        ..protocol = Protocol.BTC
        ..code = 0
        ..private = 128
        ..public = 38),
  });

  Option optionById(String i) => options[i];

  @action
  setConfig(id, option) {
    options[id] = option;
    options = options;
  }

  @action
  removeConfig(String key) {
    options.remove(key);
  }

  @computed
  Iterable<Config> get configsForWallet => (Map<String, Option>.from(options)
        ..removeWhere((k, v) => !v.config.hasProtocol()))
      .entries
      .map((entry) => entry.value.config);
}
