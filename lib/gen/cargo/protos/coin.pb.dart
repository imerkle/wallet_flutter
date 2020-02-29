///
//  Generated code. Do not modify.
//  source: cargo/protos/coin.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

class Coin extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Coin', createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Coins', createEmptyInstance: create)
    ..pc<Coin>(1, 'list', $pb.PbFieldType.PM, subBuilder: Coin.create)
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

  $core.List<Coin> get list => $_getList(0);
}

class Wallet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Wallet', createEmptyInstance: create)
    ..aOS(1, 'mnemonic')
    ..a<Coins>(2, 'coins', $pb.PbFieldType.OM, defaultOrMaker: Coins.getDefault, subBuilder: Coins.create)
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

  Coins get coins => $_getN(1);
  set coins(Coins v) { setField(2, v); }
  $core.bool hasCoins() => $_has(1);
  void clearCoins() => clearField(2);
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

class Output extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Output', createEmptyInstance: create)
    ..aOS(1, 'address')
    ..a<$core.double>(2, 'value', $pb.PbFieldType.OD)
    ..aOS(3, 'memo')
    ..hasRequiredFields = false
  ;

  Output._() : super();
  factory Output() => create();
  factory Output.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Output.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Output clone() => Output()..mergeFromMessage(this);
  Output copyWith(void Function(Output) updates) => super.copyWith((message) => updates(message as Output));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Output create() => Output._();
  Output createEmptyInstance() => create();
  static $pb.PbList<Output> createRepeated() => $pb.PbList<Output>();
  static Output getDefault() => _defaultInstance ??= create()..freeze();
  static Output _defaultInstance;

  $core.String get address => $_getS(0, '');
  set address($core.String v) { $_setString(0, v); }
  $core.bool hasAddress() => $_has(0);
  void clearAddress() => clearField(1);

  $core.double get value => $_getN(1);
  set value($core.double v) { $_setDouble(1, v); }
  $core.bool hasValue() => $_has(1);
  void clearValue() => clearField(2);

  $core.String get memo => $_getS(2, '');
  set memo($core.String v) { $_setString(2, v); }
  $core.bool hasMemo() => $_has(2);
  void clearMemo() => clearField(3);
}

class Outputs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Outputs', createEmptyInstance: create)
    ..pc<Output>(1, 'list', $pb.PbFieldType.PM, subBuilder: Output.create)
    ..hasRequiredFields = false
  ;

  Outputs._() : super();
  factory Outputs() => create();
  factory Outputs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Outputs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Outputs clone() => Outputs()..mergeFromMessage(this);
  Outputs copyWith(void Function(Outputs) updates) => super.copyWith((message) => updates(message as Outputs));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Outputs create() => Outputs._();
  Outputs createEmptyInstance() => create();
  static $pb.PbList<Outputs> createRepeated() => $pb.PbList<Outputs>();
  static Outputs getDefault() => _defaultInstance ??= create()..freeze();
  static Outputs _defaultInstance;

  $core.List<Output> get list => $_getList(0);
}

class Tx extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Tx', createEmptyInstance: create)
    ..aOS(1, 'txHex')
    ..hasRequiredFields = false
  ;

  Tx._() : super();
  factory Tx() => create();
  factory Tx.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tx.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Tx clone() => Tx()..mergeFromMessage(this);
  Tx copyWith(void Function(Tx) updates) => super.copyWith((message) => updates(message as Tx));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Tx create() => Tx._();
  Tx createEmptyInstance() => create();
  static $pb.PbList<Tx> createRepeated() => $pb.PbList<Tx>();
  static Tx getDefault() => _defaultInstance ??= create()..freeze();
  static Tx _defaultInstance;

  $core.String get txHex => $_getS(0, '');
  set txHex($core.String v) { $_setString(0, v); }
  $core.bool hasTxHex() => $_has(0);
  void clearTxHex() => clearField(1);
}

class Config extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Config', createEmptyInstance: create)
    ..aOS(1, 'rel')
    ..aOS(2, 'protocol')
    ..a<$core.int>(3, 'code', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, 'precision', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, 'private', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, 'public', $pb.PbFieldType.OU3)
    ..aOS(7, 'prefix')
    ..a<$core.int>(8, 'chainId', $pb.PbFieldType.OU3)
    ..aOS(9, 'base')
    ..aOS(10, 'curveName')
    ..aOB(11, 'isCompressed')
    ..aOB(12, 'isBech32')
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
  static Config getDefault() => _defaultInstance ??= create()..freeze();
  static Config _defaultInstance;

  $core.String get rel => $_getS(0, '');
  set rel($core.String v) { $_setString(0, v); }
  $core.bool hasRel() => $_has(0);
  void clearRel() => clearField(1);

  $core.String get protocol => $_getS(1, '');
  set protocol($core.String v) { $_setString(1, v); }
  $core.bool hasProtocol() => $_has(1);
  void clearProtocol() => clearField(2);

  $core.int get code => $_get(2, 0);
  set code($core.int v) { $_setUnsignedInt32(2, v); }
  $core.bool hasCode() => $_has(2);
  void clearCode() => clearField(3);

  $core.int get precision => $_get(3, 0);
  set precision($core.int v) { $_setUnsignedInt32(3, v); }
  $core.bool hasPrecision() => $_has(3);
  void clearPrecision() => clearField(4);

  $core.int get private => $_get(4, 0);
  set private($core.int v) { $_setUnsignedInt32(4, v); }
  $core.bool hasPrivate() => $_has(4);
  void clearPrivate() => clearField(5);

  $core.int get public => $_get(5, 0);
  set public($core.int v) { $_setUnsignedInt32(5, v); }
  $core.bool hasPublic() => $_has(5);
  void clearPublic() => clearField(6);

  $core.String get prefix => $_getS(6, '');
  set prefix($core.String v) { $_setString(6, v); }
  $core.bool hasPrefix() => $_has(6);
  void clearPrefix() => clearField(7);

  $core.int get chainId => $_get(7, 0);
  set chainId($core.int v) { $_setUnsignedInt32(7, v); }
  $core.bool hasChainId() => $_has(7);
  void clearChainId() => clearField(8);

  $core.String get base => $_getS(8, '');
  set base($core.String v) { $_setString(8, v); }
  $core.bool hasBase() => $_has(8);
  void clearBase() => clearField(9);

  $core.String get curveName => $_getS(9, '');
  set curveName($core.String v) { $_setString(9, v); }
  $core.bool hasCurveName() => $_has(9);
  void clearCurveName() => clearField(10);

  $core.bool get isCompressed => $_get(10, false);
  set isCompressed($core.bool v) { $_setBool(10, v); }
  $core.bool hasIsCompressed() => $_has(10);
  void clearIsCompressed() => clearField(11);

  $core.bool get isBech32 => $_get(11, false);
  set isBech32($core.bool v) { $_setBool(11, v); }
  $core.bool hasIsBech32() => $_has(11);
  void clearIsBech32() => clearField(12);
}

class Configs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Configs', createEmptyInstance: create)
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
  static Configs getDefault() => _defaultInstance ??= create()..freeze();
  static Configs _defaultInstance;

  $core.List<Config> get list => $_getList(0);
}

class Input extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Input', createEmptyInstance: create)
    ..a<$core.int>(1, 'vout', $pb.PbFieldType.OU3)
    ..aOS(2, 'id')
    ..a<Int64>(3, 'value', $pb.PbFieldType.OU6, defaultOrMaker: Int64.ZERO)
    ..hasRequiredFields = false
  ;

  Input._() : super();
  factory Input() => create();
  factory Input.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Input.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Input clone() => Input()..mergeFromMessage(this);
  Input copyWith(void Function(Input) updates) => super.copyWith((message) => updates(message as Input));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Input create() => Input._();
  Input createEmptyInstance() => create();
  static $pb.PbList<Input> createRepeated() => $pb.PbList<Input>();
  static Input getDefault() => _defaultInstance ??= create()..freeze();
  static Input _defaultInstance;

  $core.int get vout => $_get(0, 0);
  set vout($core.int v) { $_setUnsignedInt32(0, v); }
  $core.bool hasVout() => $_has(0);
  void clearVout() => clearField(1);

  $core.String get id => $_getS(1, '');
  set id($core.String v) { $_setString(1, v); }
  $core.bool hasId() => $_has(1);
  void clearId() => clearField(2);

  Int64 get value => $_getI64(2);
  set value(Int64 v) { $_setInt64(2, v); }
  $core.bool hasValue() => $_has(2);
  void clearValue() => clearField(3);
}

class TxOpts extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TxOpts', createEmptyInstance: create)
    ..pc<Input>(1, 'inputs', $pb.PbFieldType.PM, subBuilder: Input.create)
    ..a<Int64>(2, 'nonce', $pb.PbFieldType.OU6, defaultOrMaker: Int64.ZERO)
    ..hasRequiredFields = false
  ;

  TxOpts._() : super();
  factory TxOpts() => create();
  factory TxOpts.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TxOpts.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TxOpts clone() => TxOpts()..mergeFromMessage(this);
  TxOpts copyWith(void Function(TxOpts) updates) => super.copyWith((message) => updates(message as TxOpts));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TxOpts create() => TxOpts._();
  TxOpts createEmptyInstance() => create();
  static $pb.PbList<TxOpts> createRepeated() => $pb.PbList<TxOpts>();
  static TxOpts getDefault() => _defaultInstance ??= create()..freeze();
  static TxOpts _defaultInstance;

  $core.List<Input> get inputs => $_getList(0);

  Int64 get nonce => $_getI64(1);
  set nonce(Int64 v) { $_setInt64(1, v); }
  $core.bool hasNonce() => $_has(1);
  void clearNonce() => clearField(2);
}

class GetWalletInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetWalletInput', createEmptyInstance: create)
    ..aOS(1, 'mnemonic')
    ..a<Configs>(2, 'configs', $pb.PbFieldType.OM, defaultOrMaker: Configs.getDefault, subBuilder: Configs.create)
    ..hasRequiredFields = false
  ;

  GetWalletInput._() : super();
  factory GetWalletInput() => create();
  factory GetWalletInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetWalletInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetWalletInput clone() => GetWalletInput()..mergeFromMessage(this);
  GetWalletInput copyWith(void Function(GetWalletInput) updates) => super.copyWith((message) => updates(message as GetWalletInput));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetWalletInput create() => GetWalletInput._();
  GetWalletInput createEmptyInstance() => create();
  static $pb.PbList<GetWalletInput> createRepeated() => $pb.PbList<GetWalletInput>();
  static GetWalletInput getDefault() => _defaultInstance ??= create()..freeze();
  static GetWalletInput _defaultInstance;

  $core.String get mnemonic => $_getS(0, '');
  set mnemonic($core.String v) { $_setString(0, v); }
  $core.bool hasMnemonic() => $_has(0);
  void clearMnemonic() => clearField(1);

  Configs get configs => $_getN(1);
  set configs(Configs v) { setField(2, v); }
  $core.bool hasConfigs() => $_has(1);
  void clearConfigs() => clearField(2);
}

class GenSendTxInput extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GenSendTxInput', createEmptyInstance: create)
    ..a<Config>(1, 'config', $pb.PbFieldType.OM, defaultOrMaker: Config.getDefault, subBuilder: Config.create)
    ..a<$core.List<$core.int>>(2, 'privateKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, 'publicKey', $pb.PbFieldType.OY)
    ..a<Outputs>(4, 'outputs', $pb.PbFieldType.OM, defaultOrMaker: Outputs.getDefault, subBuilder: Outputs.create)
    ..a<TxOpts>(5, 'txOpts', $pb.PbFieldType.OM, defaultOrMaker: TxOpts.getDefault, subBuilder: TxOpts.create)
    ..hasRequiredFields = false
  ;

  GenSendTxInput._() : super();
  factory GenSendTxInput() => create();
  factory GenSendTxInput.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenSendTxInput.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GenSendTxInput clone() => GenSendTxInput()..mergeFromMessage(this);
  GenSendTxInput copyWith(void Function(GenSendTxInput) updates) => super.copyWith((message) => updates(message as GenSendTxInput));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenSendTxInput create() => GenSendTxInput._();
  GenSendTxInput createEmptyInstance() => create();
  static $pb.PbList<GenSendTxInput> createRepeated() => $pb.PbList<GenSendTxInput>();
  static GenSendTxInput getDefault() => _defaultInstance ??= create()..freeze();
  static GenSendTxInput _defaultInstance;

  Config get config => $_getN(0);
  set config(Config v) { setField(1, v); }
  $core.bool hasConfig() => $_has(0);
  void clearConfig() => clearField(1);

  $core.List<$core.int> get privateKey => $_getN(1);
  set privateKey($core.List<$core.int> v) { $_setBytes(1, v); }
  $core.bool hasPrivateKey() => $_has(1);
  void clearPrivateKey() => clearField(2);

  $core.List<$core.int> get publicKey => $_getN(2);
  set publicKey($core.List<$core.int> v) { $_setBytes(2, v); }
  $core.bool hasPublicKey() => $_has(2);
  void clearPublicKey() => clearField(3);

  Outputs get outputs => $_getN(3);
  set outputs(Outputs v) { setField(4, v); }
  $core.bool hasOutputs() => $_has(3);
  void clearOutputs() => clearField(4);

  TxOpts get txOpts => $_getN(4);
  set txOpts(TxOpts v) { setField(5, v); }
  $core.bool hasTxOpts() => $_has(4);
  void clearTxOpts() => clearField(5);
}

class WebPlatformChannel extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('WebPlatformChannel', createEmptyInstance: create)
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
  static WebPlatformChannel getDefault() => _defaultInstance ??= create()..freeze();
  static WebPlatformChannel _defaultInstance;

  $core.String get methodName => $_getS(0, '');
  set methodName($core.String v) { $_setString(0, v); }
  $core.bool hasMethodName() => $_has(0);
  void clearMethodName() => clearField(1);

  $core.List<$core.int> get input => $_getN(1);
  set input($core.List<$core.int> v) { $_setBytes(1, v); }
  $core.bool hasInput() => $_has(1);
  void clearInput() => clearField(2);
}

