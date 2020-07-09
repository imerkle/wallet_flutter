///
//  Generated code. Do not modify.
//  source: pb/wallet.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'config.pb.dart' as $3;

import 'wallet.pbenum.dart';

export 'wallet.pbenum.dart';

class Wallet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Wallet', createEmptyInstance: create)
    ..aOS(1, 'mnemonic')
    ..m<$core.String, CoinKey>(2, 'coinkeys', entryClassName: 'Wallet.CoinkeysEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: CoinKey.create)
    ..aOM<$3.Configs>(3, 'configs', subBuilder: $3.Configs.create)
    ..e<WalletKind>(4, 'walletKind', $pb.PbFieldType.OE, defaultOrMaker: WalletKind.BIP32, valueOf: WalletKind.valueOf, enumValues: WalletKind.values)
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
  @$core.pragma('dart2js:noInline')
  static Wallet getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Wallet>(create);
  static Wallet _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mnemonic => $_getSZ(0);
  @$pb.TagNumber(1)
  set mnemonic($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMnemonic() => $_has(0);
  @$pb.TagNumber(1)
  void clearMnemonic() => clearField(1);

  @$pb.TagNumber(2)
  $core.Map<$core.String, CoinKey> get coinkeys => $_getMap(1);

  @$pb.TagNumber(3)
  $3.Configs get configs => $_getN(2);
  @$pb.TagNumber(3)
  set configs($3.Configs v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasConfigs() => $_has(2);
  @$pb.TagNumber(3)
  void clearConfigs() => clearField(3);
  @$pb.TagNumber(3)
  $3.Configs ensureConfigs() => $_ensure(2);

  @$pb.TagNumber(4)
  WalletKind get walletKind => $_getN(3);
  @$pb.TagNumber(4)
  set walletKind(WalletKind v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasWalletKind() => $_has(3);
  @$pb.TagNumber(4)
  void clearWalletKind() => clearField(4);
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
  @$core.pragma('dart2js:noInline')
  static CoinKey getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CoinKey>(create);
  static CoinKey _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get privateKey => $_getN(1);
  @$pb.TagNumber(2)
  set privateKey($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrivateKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrivateKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get wif => $_getSZ(2);
  @$pb.TagNumber(3)
  set wif($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWif() => $_has(2);
  @$pb.TagNumber(3)
  void clearWif() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get address => $_getSZ(3);
  @$pb.TagNumber(4)
  set address($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAddress() => $_has(3);
  @$pb.TagNumber(4)
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
  @$core.pragma('dart2js:noInline')
  static Wallets getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Wallets>(create);
  static Wallets _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Wallet> get list => $_getList(0);
}

class GetWalletsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetWalletsRequest', createEmptyInstance: create)
    ..aOS(1, 'mnemonic')
    ..aOM<$3.Configs>(2, 'configs', subBuilder: $3.Configs.create)
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
  @$core.pragma('dart2js:noInline')
  static GetWalletsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetWalletsRequest>(create);
  static GetWalletsRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mnemonic => $_getSZ(0);
  @$pb.TagNumber(1)
  set mnemonic($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMnemonic() => $_has(0);
  @$pb.TagNumber(1)
  void clearMnemonic() => clearField(1);

  @$pb.TagNumber(2)
  $3.Configs get configs => $_getN(1);
  @$pb.TagNumber(2)
  set configs($3.Configs v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasConfigs() => $_has(1);
  @$pb.TagNumber(2)
  void clearConfigs() => clearField(2);
  @$pb.TagNumber(2)
  $3.Configs ensureConfigs() => $_ensure(1);
}

