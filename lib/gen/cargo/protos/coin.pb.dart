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
    ..aOS(1, 'publicKey')
    ..aOS(2, 'privateKey')
    ..aOS(3, 'wif')
    ..aOS(4, 'address')
    ..aOS(5, 'ticker')
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

  $core.String get publicKey => $_getS(0, '');
  set publicKey($core.String v) { $_setString(0, v); }
  $core.bool hasPublicKey() => $_has(0);
  void clearPublicKey() => clearField(1);

  $core.String get privateKey => $_getS(1, '');
  set privateKey($core.String v) { $_setString(1, v); }
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

  $core.String get ticker => $_getS(4, '');
  set ticker($core.String v) { $_setString(4, v); }
  $core.bool hasTicker() => $_has(4);
  void clearTicker() => clearField(5);
}

class CoinList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CoinList')
    ..pc<Coin>(1, 'coin', $pb.PbFieldType.PM,Coin.create)
    ..hasRequiredFields = false
  ;

  CoinList._() : super();
  factory CoinList() => create();
  factory CoinList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CoinList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CoinList clone() => CoinList()..mergeFromMessage(this);
  CoinList copyWith(void Function(CoinList) updates) => super.copyWith((message) => updates(message as CoinList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CoinList create() => CoinList._();
  CoinList createEmptyInstance() => create();
  static $pb.PbList<CoinList> createRepeated() => $pb.PbList<CoinList>();
  static CoinList getDefault() => _defaultInstance ??= create()..freeze();
  static CoinList _defaultInstance;

  $core.List<Coin> get coin => $_getList(0);
}

class TickerList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TickerList')
    ..pPS(1, 'strings')
    ..hasRequiredFields = false
  ;

  TickerList._() : super();
  factory TickerList() => create();
  factory TickerList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TickerList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TickerList clone() => TickerList()..mergeFromMessage(this);
  TickerList copyWith(void Function(TickerList) updates) => super.copyWith((message) => updates(message as TickerList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TickerList create() => TickerList._();
  TickerList createEmptyInstance() => create();
  static $pb.PbList<TickerList> createRepeated() => $pb.PbList<TickerList>();
  static TickerList getDefault() => _defaultInstance ??= create()..freeze();
  static TickerList _defaultInstance;

  $core.List<$core.String> get strings => $_getList(0);
}

