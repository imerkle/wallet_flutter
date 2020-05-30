///
//  Generated code. Do not modify.
//  source: pb/wallet.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'config.pb.dart' as $3;

class Wallet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Wallet', createEmptyInstance: create)
    ..aOS(1, 'mnemonic')
    ..m<$core.String, CoinKey>(2, 'coinkeys', entryClassName: 'Wallet.CoinkeysEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: CoinKey.create)
    ..hasRequiredFields = false
  ;

  Wallet._() : super();
  factory Wallet() => create();
  factory Wallet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Wallet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Wallet clone() => Wallet()..mergeFromMessage(this);
  Wallet copyWith(void Function(Wallet) updates) => super.copyWith((message) => updates(message as Wallet));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Wallet create() => Wallet._();
  Wallet createEmptyInstance() => create();
  static $pb.PbList<Wallet> createRepeated() => $pb.PbList<Wallet>();
  static Wallet getDefault() => _defaultInstance ??= create()..freeze();
  static Wallet _defaultInstance;

  $core.String get mnemonic => $_getS(0, '');
  set mnemonic($core.String v) { $_setString(0, v); }
  $core.bool hasMnemonic() => $_has(0);
  void clearMnemonic() => clearField(1);

  $core.Map<$core.String, CoinKey> get coinkeys => $_getMap(1);
}

class CoinKey extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CoinKey', createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'publicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'privateKey', $pb.PbFieldType.OY)
    ..aOS(3, 'wif')
    ..aOS(4, 'address')
    ..hasRequiredFields = false
  ;

  CoinKey._() : super();
  factory CoinKey() => create();
  factory CoinKey.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CoinKey.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CoinKey clone() => CoinKey()..mergeFromMessage(this);
  CoinKey copyWith(void Function(CoinKey) updates) => super.copyWith((message) => updates(message as CoinKey));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CoinKey create() => CoinKey._();
  CoinKey createEmptyInstance() => create();
  static $pb.PbList<CoinKey> createRepeated() => $pb.PbList<CoinKey>();
  static CoinKey getDefault() => _defaultInstance ??= create()..freeze();
  static CoinKey _defaultInstance;

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
}

class Wallets extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Wallets', createEmptyInstance: create)
    ..pc<Wallet>(1, 'list', $pb.PbFieldType.PM, subBuilder: Wallet.create)
    ..hasRequiredFields = false
  ;

  Wallets._() : super();
  factory Wallets() => create();
  factory Wallets.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Wallets.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Wallets clone() => Wallets()..mergeFromMessage(this);
  Wallets copyWith(void Function(Wallets) updates) => super.copyWith((message) => updates(message as Wallets));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Wallets create() => Wallets._();
  Wallets createEmptyInstance() => create();
  static $pb.PbList<Wallets> createRepeated() => $pb.PbList<Wallets>();
  static Wallets getDefault() => _defaultInstance ??= create()..freeze();
  static Wallets _defaultInstance;

  $core.List<Wallet> get list => $_getList(0);
}

class GetWalletsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetWalletsRequest', createEmptyInstance: create)
    ..aOS(1, 'mnemonic')
    ..a<$3.Configs>(2, 'configs', $pb.PbFieldType.OM, defaultOrMaker: $3.Configs.getDefault, subBuilder: $3.Configs.create)
    ..hasRequiredFields = false
  ;

  GetWalletsRequest._() : super();
  factory GetWalletsRequest() => create();
  factory GetWalletsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetWalletsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetWalletsRequest clone() => GetWalletsRequest()..mergeFromMessage(this);
  GetWalletsRequest copyWith(void Function(GetWalletsRequest) updates) => super.copyWith((message) => updates(message as GetWalletsRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetWalletsRequest create() => GetWalletsRequest._();
  GetWalletsRequest createEmptyInstance() => create();
  static $pb.PbList<GetWalletsRequest> createRepeated() => $pb.PbList<GetWalletsRequest>();
  static GetWalletsRequest getDefault() => _defaultInstance ??= create()..freeze();
  static GetWalletsRequest _defaultInstance;

  $core.String get mnemonic => $_getS(0, '');
  set mnemonic($core.String v) { $_setString(0, v); }
  $core.bool hasMnemonic() => $_has(0);
  void clearMnemonic() => clearField(1);

  $3.Configs get configs => $_getN(1);
  set configs($3.Configs v) { setField(2, v); }
  $core.bool hasConfigs() => $_has(1);
  void clearConfigs() => clearField(2);
}

