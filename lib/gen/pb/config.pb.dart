///
//  Generated code. Do not modify.
//  source: pb/config.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'config.pbenum.dart';
import '../chains/chain/chain.pbenum.dart' as $0;

export 'config.pbenum.dart';

class Config extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Config', package: const $pb.PackageName('config'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..e<Protocol>(2, 'protocol', $pb.PbFieldType.OE, defaultOrMaker: Protocol.BTC, valueOf: Protocol.valueOf, enumValues: Protocol.values)
    ..a<$core.int>(3, 'code', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, 'private', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, 'public', $pb.PbFieldType.OU3)
    ..aOS(6, 'prefix')
    ..e<CurveName>(7, 'curveName', $pb.PbFieldType.OE, defaultOrMaker: CurveName.SECP256K1, valueOf: CurveName.valueOf, enumValues: CurveName.values)
    ..a<$core.int>(8, 'chainId', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Config._() : super();
  factory Config() => create();
  factory Config.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Config.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Config clone() => Config()..mergeFromMessage(this);
  Config copyWith(void Function(Config) updates) => super.copyWith((message) => updates(message as Config));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Config create() => Config._();
  Config createEmptyInstance() => create();
  static $pb.PbList<Config> createRepeated() => $pb.PbList<Config>();
  @$core.pragma('dart2js:noInline')
  static Config getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Config>(create);
  static Config _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Protocol get protocol => $_getN(1);
  @$pb.TagNumber(2)
  set protocol(Protocol v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasProtocol() => $_has(1);
  @$pb.TagNumber(2)
  void clearProtocol() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get code => $_getIZ(2);
  @$pb.TagNumber(3)
  set code($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearCode() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get private => $_getIZ(3);
  @$pb.TagNumber(4)
  set private($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPrivate() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrivate() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get public => $_getIZ(4);
  @$pb.TagNumber(5)
  set public($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPublic() => $_has(4);
  @$pb.TagNumber(5)
  void clearPublic() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get prefix => $_getSZ(5);
  @$pb.TagNumber(6)
  set prefix($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPrefix() => $_has(5);
  @$pb.TagNumber(6)
  void clearPrefix() => clearField(6);

  @$pb.TagNumber(7)
  CurveName get curveName => $_getN(6);
  @$pb.TagNumber(7)
  set curveName(CurveName v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCurveName() => $_has(6);
  @$pb.TagNumber(7)
  void clearCurveName() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get chainId => $_getIZ(7);
  @$pb.TagNumber(8)
  set chainId($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasChainId() => $_has(7);
  @$pb.TagNumber(8)
  void clearChainId() => clearField(8);
}

class Configs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Configs', package: const $pb.PackageName('config'), createEmptyInstance: create)
    ..pc<Config>(1, 'list', $pb.PbFieldType.PM, subBuilder: Config.create)
    ..hasRequiredFields = false
  ;

  Configs._() : super();
  factory Configs() => create();
  factory Configs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Configs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Configs clone() => Configs()..mergeFromMessage(this);
  Configs copyWith(void Function(Configs) updates) => super.copyWith((message) => updates(message as Configs));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Configs create() => Configs._();
  Configs createEmptyInstance() => create();
  static $pb.PbList<Configs> createRepeated() => $pb.PbList<Configs>();
  @$core.pragma('dart2js:noInline')
  static Configs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Configs>(create);
  static Configs _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Config> get list => $_getList(0);
}

class Option extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Option', package: const $pb.PackageName('config'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(2, 'ticker')
    ..aOM<Config>(3, 'config', subBuilder: Config.create)
    ..a<$core.int>(4, 'precision', $pb.PbFieldType.O3)
    ..aOS(5, 'id')
    ..e<$0.GetBalanceRequestKind>(6, 'brkind', $pb.PbFieldType.OE, defaultOrMaker: $0.GetBalanceRequestKind.BLOCKBOOK, valueOf: $0.GetBalanceRequestKind.valueOf, enumValues: $0.GetBalanceRequestKind.values)
    ..aOS(7, 'brhash')
    ..aOS(8, 'brurl')
    ..hasRequiredFields = false
  ;

  Option._() : super();
  factory Option() => create();
  factory Option.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Option.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Option clone() => Option()..mergeFromMessage(this);
  Option copyWith(void Function(Option) updates) => super.copyWith((message) => updates(message as Option));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Option create() => Option._();
  Option createEmptyInstance() => create();
  static $pb.PbList<Option> createRepeated() => $pb.PbList<Option>();
  @$core.pragma('dart2js:noInline')
  static Option getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Option>(create);
  static Option _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get ticker => $_getSZ(1);
  @$pb.TagNumber(2)
  set ticker($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTicker() => $_has(1);
  @$pb.TagNumber(2)
  void clearTicker() => clearField(2);

  @$pb.TagNumber(3)
  Config get config => $_getN(2);
  @$pb.TagNumber(3)
  set config(Config v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasConfig() => $_has(2);
  @$pb.TagNumber(3)
  void clearConfig() => clearField(3);
  @$pb.TagNumber(3)
  Config ensureConfig() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get precision => $_getIZ(3);
  @$pb.TagNumber(4)
  set precision($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPrecision() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrecision() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get id => $_getSZ(4);
  @$pb.TagNumber(5)
  set id($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasId() => $_has(4);
  @$pb.TagNumber(5)
  void clearId() => clearField(5);

  @$pb.TagNumber(6)
  $0.GetBalanceRequestKind get brkind => $_getN(5);
  @$pb.TagNumber(6)
  set brkind($0.GetBalanceRequestKind v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasBrkind() => $_has(5);
  @$pb.TagNumber(6)
  void clearBrkind() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get brhash => $_getSZ(6);
  @$pb.TagNumber(7)
  set brhash($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBrhash() => $_has(6);
  @$pb.TagNumber(7)
  void clearBrhash() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get brurl => $_getSZ(7);
  @$pb.TagNumber(8)
  set brurl($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasBrurl() => $_has(7);
  @$pb.TagNumber(8)
  void clearBrurl() => clearField(8);
}

class WebPlatformChannel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WebPlatformChannel', package: const $pb.PackageName('config'), createEmptyInstance: create)
    ..aOS(1, 'methodName')
    ..a<$core.List<$core.int>>(2, 'input', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  WebPlatformChannel._() : super();
  factory WebPlatformChannel() => create();
  factory WebPlatformChannel.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WebPlatformChannel.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  WebPlatformChannel clone() => WebPlatformChannel()..mergeFromMessage(this);
  WebPlatformChannel copyWith(void Function(WebPlatformChannel) updates) => super.copyWith((message) => updates(message as WebPlatformChannel));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static WebPlatformChannel create() => WebPlatformChannel._();
  WebPlatformChannel createEmptyInstance() => create();
  static $pb.PbList<WebPlatformChannel> createRepeated() => $pb.PbList<WebPlatformChannel>();
  @$core.pragma('dart2js:noInline')
  static WebPlatformChannel getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WebPlatformChannel>(create);
  static WebPlatformChannel _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get methodName => $_getSZ(0);
  @$pb.TagNumber(1)
  set methodName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMethodName() => $_has(0);
  @$pb.TagNumber(1)
  void clearMethodName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get input => $_getN(1);
  @$pb.TagNumber(2)
  set input($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInput() => $_has(1);
  @$pb.TagNumber(2)
  void clearInput() => clearField(2);
}

