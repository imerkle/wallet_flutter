///
//  Generated code. Do not modify.
//  source: pb/transaction.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

import 'config.pb.dart' as $3;

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

class Output extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Output', createEmptyInstance: create)
    ..aOS(1, 'address')
    ..a<Int64>(2, 'value', $pb.PbFieldType.OU6, defaultOrMaker: Int64.ZERO)
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

  Int64 get value => $_getI64(1);
  set value(Int64 v) { $_setInt64(1, v); }
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

class GenSendTransactionRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GenSendTransactionRequest', createEmptyInstance: create)
    ..a<$3.Config>(1, 'config', $pb.PbFieldType.OM, defaultOrMaker: $3.Config.getDefault, subBuilder: $3.Config.create)
    ..a<$core.List<$core.int>>(2, 'privateKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, 'publicKey', $pb.PbFieldType.OY)
    ..a<Outputs>(4, 'outputs', $pb.PbFieldType.OM, defaultOrMaker: Outputs.getDefault, subBuilder: Outputs.create)
    ..a<TxOpts>(5, 'txOpts', $pb.PbFieldType.OM, defaultOrMaker: TxOpts.getDefault, subBuilder: TxOpts.create)
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
  static GenSendTransactionRequest getDefault() => _defaultInstance ??= create()..freeze();
  static GenSendTransactionRequest _defaultInstance;

  $3.Config get config => $_getN(0);
  set config($3.Config v) { setField(1, v); }
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

