///
//  Generated code. Do not modify.
//  source: pb/transaction.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'config.pb.dart' as $3;

class Input extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Input', createEmptyInstance: create)
    ..a<$core.int>(1, 'vout', $pb.PbFieldType.OU3)
    ..aOS(2, 'id')
    ..a<$fixnum.Int64>(3, 'value', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
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
  @$core.pragma('dart2js:noInline')
  static Input getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Input>(create);
  static Input _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get vout => $_getIZ(0);
  @$pb.TagNumber(1)
  set vout($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVout() => $_has(0);
  @$pb.TagNumber(1)
  void clearVout() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get value => $_getI64(2);
  @$pb.TagNumber(3)
  set value($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearValue() => clearField(3);
}

class Output extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Output', createEmptyInstance: create)
    ..aOS(1, 'address')
    ..a<$fixnum.Int64>(2, 'value', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
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
  @$core.pragma('dart2js:noInline')
  static Output getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Output>(create);
  static Output _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get value => $_getI64(1);
  @$pb.TagNumber(2)
  set value($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get memo => $_getSZ(2);
  @$pb.TagNumber(3)
  set memo($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMemo() => $_has(2);
  @$pb.TagNumber(3)
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
  @$core.pragma('dart2js:noInline')
  static Outputs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Outputs>(create);
  static Outputs _defaultInstance;

  @$pb.TagNumber(1)
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
  @$core.pragma('dart2js:noInline')
  static Tx getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Tx>(create);
  static Tx _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get txHex => $_getSZ(0);
  @$pb.TagNumber(1)
  set txHex($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTxHex() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxHex() => clearField(1);
}

class TxOpts extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TxOpts', createEmptyInstance: create)
    ..pc<Input>(1, 'inputs', $pb.PbFieldType.PM, subBuilder: Input.create)
    ..a<$fixnum.Int64>(2, 'nonce', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
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
  @$core.pragma('dart2js:noInline')
  static TxOpts getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TxOpts>(create);
  static TxOpts _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Input> get inputs => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get nonce => $_getI64(1);
  @$pb.TagNumber(2)
  set nonce($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNonce() => $_has(1);
  @$pb.TagNumber(2)
  void clearNonce() => clearField(2);
}

class GenSendTransactionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GenSendTransactionRequest', createEmptyInstance: create)
    ..aOM<$3.Config>(1, 'config', subBuilder: $3.Config.create)
    ..a<$core.List<$core.int>>(2, 'privateKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, 'publicKey', $pb.PbFieldType.OY)
    ..aOM<Outputs>(4, 'outputs', subBuilder: Outputs.create)
    ..aOM<TxOpts>(5, 'txOpts', subBuilder: TxOpts.create)
    ..hasRequiredFields = false
  ;

  GenSendTransactionRequest._() : super();
  factory GenSendTransactionRequest() => create();
  factory GenSendTransactionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenSendTransactionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GenSendTransactionRequest clone() => GenSendTransactionRequest()..mergeFromMessage(this);
  GenSendTransactionRequest copyWith(void Function(GenSendTransactionRequest) updates) => super.copyWith((message) => updates(message as GenSendTransactionRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GenSendTransactionRequest create() => GenSendTransactionRequest._();
  GenSendTransactionRequest createEmptyInstance() => create();
  static $pb.PbList<GenSendTransactionRequest> createRepeated() => $pb.PbList<GenSendTransactionRequest>();
  @$core.pragma('dart2js:noInline')
  static GenSendTransactionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenSendTransactionRequest>(create);
  static GenSendTransactionRequest _defaultInstance;

  @$pb.TagNumber(1)
  $3.Config get config => $_getN(0);
  @$pb.TagNumber(1)
  set config($3.Config v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasConfig() => $_has(0);
  @$pb.TagNumber(1)
  void clearConfig() => clearField(1);
  @$pb.TagNumber(1)
  $3.Config ensureConfig() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get privateKey => $_getN(1);
  @$pb.TagNumber(2)
  set privateKey($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrivateKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrivateKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get publicKey => $_getN(2);
  @$pb.TagNumber(3)
  set publicKey($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPublicKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublicKey() => clearField(3);

  @$pb.TagNumber(4)
  Outputs get outputs => $_getN(3);
  @$pb.TagNumber(4)
  set outputs(Outputs v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasOutputs() => $_has(3);
  @$pb.TagNumber(4)
  void clearOutputs() => clearField(4);
  @$pb.TagNumber(4)
  Outputs ensureOutputs() => $_ensure(3);

  @$pb.TagNumber(5)
  TxOpts get txOpts => $_getN(4);
  @$pb.TagNumber(5)
  set txOpts(TxOpts v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTxOpts() => $_has(4);
  @$pb.TagNumber(5)
  void clearTxOpts() => clearField(5);
  @$pb.TagNumber(5)
  TxOpts ensureTxOpts() => $_ensure(4);
}

