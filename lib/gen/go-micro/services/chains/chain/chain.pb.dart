///
//  Generated code. Do not modify.
//  source: go-micro/services/chains/chain/chain.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart';
import 'package:protobuf/protobuf.dart' as $pb;

import 'chain.pbenum.dart';

export 'chain.pbenum.dart';

class Input extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Input', package: const $pb.PackageName('chain'), createEmptyInstance: create)
    ..aOS(1, 'address')
    ..aInt64(2, 'value')
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

  $core.String get address => $_getS(0, '');
  set address($core.String v) { $_setString(0, v); }
  $core.bool hasAddress() => $_has(0);
  void clearAddress() => clearField(1);

  Int64 get value => $_getI64(1);
  set value(Int64 v) { $_setInt64(1, v); }
  $core.bool hasValue() => $_has(1);
  void clearValue() => clearField(2);
}

class Gas extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Gas', package: const $pb.PackageName('chain'), createEmptyInstance: create)
    ..a<$core.int>(1, 'used', $pb.PbFieldType.O3)
    ..a<$core.int>(2, 'price', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Gas._() : super();
  factory Gas() => create();
  factory Gas.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Gas.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Gas clone() => Gas()..mergeFromMessage(this);
  Gas copyWith(void Function(Gas) updates) => super.copyWith((message) => updates(message as Gas));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Gas create() => Gas._();
  Gas createEmptyInstance() => create();
  static $pb.PbList<Gas> createRepeated() => $pb.PbList<Gas>();
  static Gas getDefault() => _defaultInstance ??= create()..freeze();
  static Gas _defaultInstance;

  $core.int get used => $_get(0, 0);
  set used($core.int v) { $_setSignedInt32(0, v); }
  $core.bool hasUsed() => $_has(0);
  void clearUsed() => clearField(1);

  $core.int get price => $_get(1, 0);
  set price($core.int v) { $_setSignedInt32(1, v); }
  $core.bool hasPrice() => $_has(1);
  void clearPrice() => clearField(2);
}

class Transaction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Transaction', package: const $pb.PackageName('chain'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..pc<Input>(2, 'inputs', $pb.PbFieldType.PM, subBuilder: Input.create)
    ..pc<Input>(3, 'outputs', $pb.PbFieldType.PM, subBuilder: Input.create)
    ..e<TransactionKind>(4, 'kind', $pb.PbFieldType.OE, defaultOrMaker: TransactionKind.TRANSFER, valueOf: TransactionKind.valueOf, enumValues: TransactionKind.values)
    ..e<Direction>(5, 'direction', $pb.PbFieldType.OE, defaultOrMaker: Direction.OUTGOING, valueOf: Direction.valueOf, enumValues: Direction.values)
    ..aInt64(6, 'fees')
    ..a<$core.int>(7, 'confimations', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Transaction._() : super();
  factory Transaction() => create();
  factory Transaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Transaction clone() => Transaction()..mergeFromMessage(this);
  Transaction copyWith(void Function(Transaction) updates) => super.copyWith((message) => updates(message as Transaction));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Transaction create() => Transaction._();
  Transaction createEmptyInstance() => create();
  static $pb.PbList<Transaction> createRepeated() => $pb.PbList<Transaction>();
  static Transaction getDefault() => _defaultInstance ??= create()..freeze();
  static Transaction _defaultInstance;

  $core.String get id => $_getS(0, '');
  set id($core.String v) { $_setString(0, v); }
  $core.bool hasId() => $_has(0);
  void clearId() => clearField(1);

  $core.List<Input> get inputs => $_getList(1);

  $core.List<Input> get outputs => $_getList(2);

  TransactionKind get kind => $_getN(3);
  set kind(TransactionKind v) { setField(4, v); }
  $core.bool hasKind() => $_has(3);
  void clearKind() => clearField(4);

  Direction get direction => $_getN(4);
  set direction(Direction v) { setField(5, v); }
  $core.bool hasDirection() => $_has(4);
  void clearDirection() => clearField(5);

  Int64 get fees => $_getI64(5);
  set fees(Int64 v) { $_setInt64(5, v); }
  $core.bool hasFees() => $_has(5);
  void clearFees() => clearField(6);

  $core.int get confimations => $_get(6, 0);
  set confimations($core.int v) { $_setSignedInt32(6, v); }
  $core.bool hasConfimations() => $_has(6);
  void clearConfimations() => clearField(7);
}

class Balance extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Balance', package: const $pb.PackageName('chain'), createEmptyInstance: create)
    ..aInt64(1, 'unlocked')
    ..aInt64(2, 'locked')
    ..hasRequiredFields = false
  ;

  Balance._() : super();
  factory Balance() => create();
  factory Balance.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Balance.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Balance clone() => Balance()..mergeFromMessage(this);
  Balance copyWith(void Function(Balance) updates) => super.copyWith((message) => updates(message as Balance));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Balance create() => Balance._();
  Balance createEmptyInstance() => create();
  static $pb.PbList<Balance> createRepeated() => $pb.PbList<Balance>();
  static Balance getDefault() => _defaultInstance ??= create()..freeze();
  static Balance _defaultInstance;

  Int64 get unlocked => $_getI64(0);
  set unlocked(Int64 v) { $_setInt64(0, v); }
  $core.bool hasUnlocked() => $_has(0);
  void clearUnlocked() => clearField(1);

  Int64 get locked => $_getI64(1);
  set locked(Int64 v) { $_setInt64(1, v); }
  $core.bool hasLocked() => $_has(1);
  void clearLocked() => clearField(2);
}

class GetBalanceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetBalanceRequest', package: const $pb.PackageName('chain'), createEmptyInstance: create)
    ..e<GetBalanceRequestKind>(1, 'kind', $pb.PbFieldType.OE, defaultOrMaker: GetBalanceRequestKind.BLOCKBOOK, valueOf: GetBalanceRequestKind.valueOf, enumValues: GetBalanceRequestKind.values)
    ..aOS(2, 'api')
    ..aOS(3, 'address')
    ..aOS(4, 'hash')
    ..aInt64(5, 'precision')
    ..hasRequiredFields = false
  ;

  GetBalanceRequest._() : super();
  factory GetBalanceRequest() => create();
  factory GetBalanceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBalanceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetBalanceRequest clone() => GetBalanceRequest()..mergeFromMessage(this);
  GetBalanceRequest copyWith(void Function(GetBalanceRequest) updates) => super.copyWith((message) => updates(message as GetBalanceRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBalanceRequest create() => GetBalanceRequest._();
  GetBalanceRequest createEmptyInstance() => create();
  static $pb.PbList<GetBalanceRequest> createRepeated() => $pb.PbList<GetBalanceRequest>();
  static GetBalanceRequest getDefault() => _defaultInstance ??= create()..freeze();
  static GetBalanceRequest _defaultInstance;

  GetBalanceRequestKind get kind => $_getN(0);
  set kind(GetBalanceRequestKind v) { setField(1, v); }
  $core.bool hasKind() => $_has(0);
  void clearKind() => clearField(1);

  $core.String get api => $_getS(1, '');
  set api($core.String v) { $_setString(1, v); }
  $core.bool hasApi() => $_has(1);
  void clearApi() => clearField(2);

  $core.String get address => $_getS(2, '');
  set address($core.String v) { $_setString(2, v); }
  $core.bool hasAddress() => $_has(2);
  void clearAddress() => clearField(3);

  $core.String get hash => $_getS(3, '');
  set hash($core.String v) { $_setString(3, v); }
  $core.bool hasHash() => $_has(3);
  void clearHash() => clearField(4);

  Int64 get precision => $_getI64(4);
  set precision(Int64 v) { $_setInt64(4, v); }
  $core.bool hasPrecision() => $_has(4);
  void clearPrecision() => clearField(5);
}

class GetBalanceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetBalanceResponse', package: const $pb.PackageName('chain'), createEmptyInstance: create)
    ..a<Balance>(1, 'balance', $pb.PbFieldType.OM, defaultOrMaker: Balance.getDefault, subBuilder: Balance.create)
    ..hasRequiredFields = false
  ;

  GetBalanceResponse._() : super();
  factory GetBalanceResponse() => create();
  factory GetBalanceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBalanceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetBalanceResponse clone() => GetBalanceResponse()..mergeFromMessage(this);
  GetBalanceResponse copyWith(void Function(GetBalanceResponse) updates) => super.copyWith((message) => updates(message as GetBalanceResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetBalanceResponse create() => GetBalanceResponse._();
  GetBalanceResponse createEmptyInstance() => create();
  static $pb.PbList<GetBalanceResponse> createRepeated() => $pb.PbList<GetBalanceResponse>();
  static GetBalanceResponse getDefault() => _defaultInstance ??= create()..freeze();
  static GetBalanceResponse _defaultInstance;

  Balance get balance => $_getN(0);
  set balance(Balance v) { setField(1, v); }
  $core.bool hasBalance() => $_has(0);
  void clearBalance() => clearField(1);
}

