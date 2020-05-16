import 'package:mobx/mobx.dart';
import 'package:wallet_flutter/gen/cargo/protos/coin.pb.dart';
import 'package:wallet_flutter/gen/go-micro/services/chains/chain/chain.pbserver.dart';
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
        brurl: "https://tbtc1.trezor.io/api/v2",
        brkind: GetBalanceRequestKind.BLOCKBOOK,
        precision: 8,
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
        precision: 18,
        config: Config()
          ..id = "eth"
          ..protocol = Protocol.ETH
          ..code = 60
          ..chainId = 3),
    "btg": ConfigAtom(
      id: "btg",
      name: "Bitcoin Gold",
      ticker: "btc",
      brurl: "https://btg1.trezor.io/api/v2",
      brkind: GetBalanceRequestKind.BLOCKBOOK,
      precision: 8,
      config: Config()
        ..id = "btg"
        ..protocol = Protocol.BTC
        ..code = 0
        ..private = 128
        ..public = 38,
    ),
  };

  @observable
  Map<String, List<String>> coins = {
    "btc": ["btc"],
    "eth": ["eth"],
  };

  @observable
  String base = "btc";
  @observable
  String id = "btc";

  @computed
  ConfigAtom get coin => configs[id];

  @action
  void setId(String s) {
    id = s;
  }

  @action
  void setBase(String s) {
    base = s;
  }
}
