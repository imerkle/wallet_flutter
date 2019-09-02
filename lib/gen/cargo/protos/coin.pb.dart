///
//  Generated code. Do not modify.
//  source: cargo/protos/coin.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, pragma, String;

import 'package:protobuf/protobuf.dart' as $pb;

class Coin extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Coin')
    ..a<$core.List<$core.int>>(1, 'publicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'privateKey', $pb.PbFieldType.OY)
    ..aOS(3, 'wif')
    ..aOS(4, 'address')
    ..aOS(5, 'rel')
    ..aOS(6, 'base')
    ..hasRequiredFields = false
  ;

  Coin._() : super();
  factory Coin() => create();
  factory Coin.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Coin.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Coin clone() => Coin()..mergeFromMessage(this);
  Coin copyWith(void Function(Coin) updates) => super.copyWith((message) => updates(message as Coin));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Coin create() => Coin._();
  Coin createEmptyInstance() => create();
  static $pb.PbList<Coin> createRepeated() => $pb.PbList<Coin>();
  static Coin getDefault() => _defaultInstance ??= create()..freeze();
  static Coin _defaultInstance;

  $core.List<$core.int> get publicKey => $_getN(0);
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasPublicKey() => $_has(0);
  void clearPublicKey() => clearField(1);

  $core.List<$core.int> get privateKey => $_getN(1);
  set privateKey($core.List<$core.int> v) { $_setBytes(1, v); }
  $core.bool hasPrivateKey() => $_has(1);
  void clearPrivateKey() => clearField(2);

  $core.String get wif => $_getS(2, '');
  set wif($core.String v) { $_setString(2, v); }
  $core.bool hasWif() => $_has(2);
  void clearWif() => clearField(3);

  $core.String get address => $_getS(3, '');
  set address($core.String v) { $_setString(3, v); }
  $core.bool hasAddress() => $_has(3);
  void clearAddress() => clearField(4);

  $core.String get rel => $_getS(4, '');
  set rel($core.String v) { $_setString(4, v); }
  $core.bool hasRel() => $_has(4);
  void clearRel() => clearField(5);

  $core.String get base => $_getS(5, '');
  set base($core.String v) { $_setString(5, v); }
  $core.bool hasBase() => $_has(5);
  void clearBase() => clearField(6);
}

class Coins extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Coins')
    ..pc<Coin>(1, 'coin', $pb.PbFieldType.PM,Coin.create)
    ..aOS(2, 'base')
    ..hasRequiredFields = false
  ;

  Coins._() : super();
  factory Coins() => create();
  factory Coins.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Coins.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Coins clone() => Coins()..mergeFromMessage(this);
  Coins copyWith(void Function(Coins) updates) => super.copyWith((message) => updates(message as Coins));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Coins create() => Coins._();
  Coins createEmptyInstance() => create();
  static $pb.PbList<Coins> createRepeated() => $pb.PbList<Coins>();
  static Coins getDefault() => _defaultInstance ??= create()..freeze();
  static Coins _defaultInstance;

  $core.List<Coin> get coin => $_getList(0);

  $core.String get base => $_getS(1, '');
  set base($core.String v) { $_setString(1, v); }
  $core.bool hasBase() => $_has(1);
  void clearBase() => clearField(2);
}

class Tickers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Tickers')
    ..pc<Ticker>(1, 'ticker', $pb.PbFieldType.PM,Ticker.create)
    ..hasRequiredFields = false
  ;

  Tickers._() : super();
  factory Tickers() => create();
  factory Tickers.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tickers.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Tickers clone() => Tickers()..mergeFromMessage(this);
  Tickers copyWith(void Function(Tickers) updates) => super.copyWith((message) => updates(message as Tickers));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Tickers create() => Tickers._();
  Tickers createEmptyInstance() => create();
  static $pb.PbList<Tickers> createRepeated() => $pb.PbList<Tickers>();
  static Tickers getDefault() => _defaultInstance ??= create()..freeze();
  static Tickers _defaultInstance;

  $core.List<Ticker> get ticker => $_getList(0);
}

class Ticker extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Ticker')
    ..pPS(1, 'rel')
    ..aOS(2, 'base')
    ..hasRequiredFields = false
  ;

  Ticker._() : super();
  factory Ticker() => create();
  factory Ticker.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ticker.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Ticker clone() => Ticker()..mergeFromMessage(this);
  Ticker copyWith(void Function(Ticker) updates) => super.copyWith((message) => updates(message as Ticker));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Ticker create() => Ticker._();
  Ticker createEmptyInstance() => create();
  static $pb.PbList<Ticker> createRepeated() => $pb.PbList<Ticker>();
  static Ticker getDefault() => _defaultInstance ??= create()..freeze();
  static Ticker _defaultInstance;

  $core.List<$core.String> get rel => $_getList(0);

  $core.String get base => $_getS(1, '');
  set base($core.String v) { $_setString(1, v); }
  $core.bool hasBase() => $_has(1);
  void clearBase() => clearField(2);
}

