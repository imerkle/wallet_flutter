import 'package:wallet_flutter/gen/config.pb.dart';
import 'package:wallet_flutter/gen/go-micro/services/chains/chain/chain.pbserver.dart';

class ExplorerConfig {
  ExplorerConfig({this.api, this.kind});
  String api;
  String kind;
}

class ConfigAtom {
  ConfigAtom({
    this.name,
    this.ticker,
    this.config,
    this.precision,
    this.id,
    this.brkind,
    this.brurl,
    this.brhash,
  });
  String brhash, brurl, ticker, name, id;
  GetBalanceRequestKind brkind;
  Config config;
  int precision;
}
