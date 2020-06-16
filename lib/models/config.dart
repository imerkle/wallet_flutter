import 'dart:ui';

import 'package:wallet_flutter/gen/chains/chain/chain.pbenum.dart';
import 'package:wallet_flutter/gen/pb/config.pb.dart';

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
    this.color,
  });
  Color color;
  String brhash, brurl, ticker, name, id;
  GetBalanceRequestKind brkind;
  Config config;
  int precision;
}
