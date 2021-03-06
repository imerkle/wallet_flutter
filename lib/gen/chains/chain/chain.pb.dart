///
//  Generated code. Do not modify.
//  source: chains/chain/chain.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../common/timestamp/timestamp.pb.dart' as $2;

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
  @$core.pragma('dart2js:noInline')
  static Input getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Input>(create);
  static Input _defaultInstance;

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
}

class Gas extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Gas', package: const $pb.PackageName('chain'), createEmptyInstance: create)
    ..aInt64(1, 'used')
    ..aInt64(2, 'price')
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
  @$core.pragma('dart2js:noInline')
  static Gas getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Gas>(create);
  static Gas _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get used => $_getI64(0);
  @$pb.TagNumber(1)
  set used($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUsed() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsed() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get price => $_getI64(1);
  @$pb.TagNumber(2)
  set price($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);
}

class Transaction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Transaction', package: const $pb.PackageName('chain'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..pc<Input>(2, 'inputs', $pb.PbFieldType.PM, subBuilder: Input.create)
    ..pc<Input>(3, 'outputs', $pb.PbFieldType.PM, subBuilder: Input.create)
    ..e<TransactionKind>(4, 'kind', $pb.PbFieldType.OE, defaultOrMaker: TransactionKind.TRANSFER, valueOf: TransactionKind.valueOf, enumValues: TransactionKind.values)
    ..e<Direction>(5, 'direction', $pb.PbFieldType.OE, defaultOrMaker: Direction.OUTGOING, valueOf: Direction.valueOf, enumValues: Direction.values)
    ..aOM<Gas>(6, 'fees', subBuilder: Gas.create)
    ..aInt64(7, 'confimations')
    ..aOM<$2.Timestamp>(8, 'timestamp', subBuilder: $2.Timestamp.create)
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
  @$core.pragma('dart2js:noInline')
  static Transaction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transaction>(create);
  static Transaction _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Input> get inputs => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<Input> get outputs => $_getList(2);

  @$pb.TagNumber(4)
  TransactionKind get kind => $_getN(3);
  @$pb.TagNumber(4)
  set kind(TransactionKind v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasKind() => $_has(3);
  @$pb.TagNumber(4)
  void clearKind() => clearField(4);

  @$pb.TagNumber(5)
  Direction get direction => $_getN(4);
  @$pb.TagNumber(5)
  set direction(Direction v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasDirection() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirection() => clearField(5);

  @$pb.TagNumber(6)
  Gas get fees => $_getN(5);
  @$pb.TagNumber(6)
  set fees(Gas v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasFees() => $_has(5);
  @$pb.TagNumber(6)
  void clearFees() => clearField(6);
  @$pb.TagNumber(6)
  Gas ensureFees() => $_ensure(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get confimations => $_getI64(6);
  @$pb.TagNumber(7)
  set confimations($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasConfimations() => $_has(6);
  @$pb.TagNumber(7)
  void clearConfimations() => clearField(7);

  @$pb.TagNumber(8)
  $2.Timestamp get timestamp => $_getN(7);
  @$pb.TagNumber(8)
  set timestamp($2.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasTimestamp() => $_has(7);
  @$pb.TagNumber(8)
  void clearTimestamp() => clearField(8);
  @$pb.TagNumber(8)
  $2.Timestamp ensureTimestamp() => $_ensure(7);
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
  @$core.pragma('dart2js:noInline')
  static Balance getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Balance>(create);
  static Balance _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get unlocked => $_getI64(0);
  @$pb.TagNumber(1)
  set unlocked($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUnlocked() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnlocked() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get locked => $_getI64(1);
  @$pb.TagNumber(2)
  set locked($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocked() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocked() => clearField(2);
}

class BalanceNormalized extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BalanceNormalized', package: const $pb.PackageName('chain'), createEmptyInstance: create)
    ..a<$core.double>(1, 'unlocked', $pb.PbFieldType.OD)
    ..a<$core.double>(2, 'locked', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  BalanceNormalized._() : super();
  factory BalanceNormalized() => create();
  factory BalanceNormalized.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BalanceNormalized.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BalanceNormalized clone() => BalanceNormalized()..mergeFromMessage(this);
  BalanceNormalized copyWith(void Function(BalanceNormalized) updates) => super.copyWith((message) => updates(message as BalanceNormalized));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BalanceNormalized create() => BalanceNormalized._();
  BalanceNormalized createEmptyInstance() => create();
  static $pb.PbList<BalanceNormalized> createRepeated() => $pb.PbList<BalanceNormalized>();
  @$core.pragma('dart2js:noInline')
  static BalanceNormalized getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BalanceNormalized>(create);
  static BalanceNormalized _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get unlocked => $_getN(0);
  @$pb.TagNumber(1)
  set unlocked($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUnlocked() => $_has(0);
  @$pb.TagNumber(1)
  void clearUnlocked() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get locked => $_getN(1);
  @$pb.TagNumber(2)
  set locked($core.double v) { $_setDouble(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocked() => $_has(1);
  @$pb.TagNumber(2)
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
  @$core.pragma('dart2js:noInline')
  static GetBalanceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBalanceRequest>(create);
  static GetBalanceRequest _defaultInstance;

  @$pb.TagNumber(1)
  GetBalanceRequestKind get kind => $_getN(0);
  @$pb.TagNumber(1)
  set kind(GetBalanceRequestKind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasKind() => $_has(0);
  @$pb.TagNumber(1)
  void clearKind() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get api => $_getSZ(1);
  @$pb.TagNumber(2)
  set api($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasApi() => $_has(1);
  @$pb.TagNumber(2)
  void clearApi() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get address => $_getSZ(2);
  @$pb.TagNumber(3)
  set address($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get hash => $_getSZ(3);
  @$pb.TagNumber(4)
  set hash($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHash() => $_has(3);
  @$pb.TagNumber(4)
  void clearHash() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get precision => $_getI64(4);
  @$pb.TagNumber(5)
  set precision($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPrecision() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrecision() => clearField(5);
}

class GetBalanceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetBalanceResponse', package: const $pb.PackageName('chain'), createEmptyInstance: create)
    ..aOM<Balance>(1, 'balance', subBuilder: Balance.create)
    ..aOM<BalanceNormalized>(2, 'balanceNormalized', subBuilder: BalanceNormalized.create)
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
  @$core.pragma('dart2js:noInline')
  static GetBalanceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBalanceResponse>(create);
  static GetBalanceResponse _defaultInstance;

  @$pb.TagNumber(1)
  Balance get balance => $_getN(0);
  @$pb.TagNumber(1)
  set balance(Balance v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBalance() => $_has(0);
  @$pb.TagNumber(1)
  void clearBalance() => clearField(1);
  @$pb.TagNumber(1)
  Balance ensureBalance() => $_ensure(0);

  @$pb.TagNumber(2)
  BalanceNormalized get balanceNormalized => $_getN(1);
  @$pb.TagNumber(2)
  set balanceNormalized(BalanceNormalized v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBalanceNormalized() => $_has(1);
  @$pb.TagNumber(2)
  void clearBalanceNormalized() => clearField(2);
  @$pb.TagNumber(2)
  BalanceNormalized ensureBalanceNormalized() => $_ensure(1);
}

class GetPriceRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetPriceRequest', package: const $pb.PackageName('chain'), createEmptyInstance: create)
    ..aOS(1, 'id')
    ..aOS(2, 'fiatTicker')
    ..hasRequiredFields = false
  ;

  GetPriceRequest._() : super();
  factory GetPriceRequest() => create();
  factory GetPriceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPriceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetPriceRequest clone() => GetPriceRequest()..mergeFromMessage(this);
  GetPriceRequest copyWith(void Function(GetPriceRequest) updates) => super.copyWith((message) => updates(message as GetPriceRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPriceRequest create() => GetPriceRequest._();
  GetPriceRequest createEmptyInstance() => create();
  static $pb.PbList<GetPriceRequest> createRepeated() => $pb.PbList<GetPriceRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPriceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPriceRequest>(create);
  static GetPriceRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fiatTicker => $_getSZ(1);
  @$pb.TagNumber(2)
  set fiatTicker($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFiatTicker() => $_has(1);
  @$pb.TagNumber(2)
  void clearFiatTicker() => clearField(2);
}

class GetTransactionsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetTransactionsRequest', package: const $pb.PackageName('chain'), createEmptyInstance: create)
    ..aOS(1, 'address')
    ..e<GetBalanceRequestKind>(2, 'kind', $pb.PbFieldType.OE, defaultOrMaker: GetBalanceRequestKind.BLOCKBOOK, valueOf: GetBalanceRequestKind.valueOf, enumValues: GetBalanceRequestKind.values)
    ..aOS(3, 'api')
    ..aInt64(4, 'precision')
    ..hasRequiredFields = false
  ;

  GetTransactionsRequest._() : super();
  factory GetTransactionsRequest() => create();
  factory GetTransactionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTransactionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetTransactionsRequest clone() => GetTransactionsRequest()..mergeFromMessage(this);
  GetTransactionsRequest copyWith(void Function(GetTransactionsRequest) updates) => super.copyWith((message) => updates(message as GetTransactionsRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTransactionsRequest create() => GetTransactionsRequest._();
  GetTransactionsRequest createEmptyInstance() => create();
  static $pb.PbList<GetTransactionsRequest> createRepeated() => $pb.PbList<GetTransactionsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTransactionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTransactionsRequest>(create);
  static GetTransactionsRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  GetBalanceRequestKind get kind => $_getN(1);
  @$pb.TagNumber(2)
  set kind(GetBalanceRequestKind v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasKind() => $_has(1);
  @$pb.TagNumber(2)
  void clearKind() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get api => $_getSZ(2);
  @$pb.TagNumber(3)
  set api($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasApi() => $_has(2);
  @$pb.TagNumber(3)
  void clearApi() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get precision => $_getI64(3);
  @$pb.TagNumber(4)
  set precision($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPrecision() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrecision() => clearField(4);
}

class GetTransactionsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetTransactionsResponse', package: const $pb.PackageName('chain'), createEmptyInstance: create)
    ..pc<Transaction>(1, 'transactions', $pb.PbFieldType.PM, subBuilder: Transaction.create)
    ..hasRequiredFields = false
  ;

  GetTransactionsResponse._() : super();
  factory GetTransactionsResponse() => create();
  factory GetTransactionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTransactionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetTransactionsResponse clone() => GetTransactionsResponse()..mergeFromMessage(this);
  GetTransactionsResponse copyWith(void Function(GetTransactionsResponse) updates) => super.copyWith((message) => updates(message as GetTransactionsResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetTransactionsResponse create() => GetTransactionsResponse._();
  GetTransactionsResponse createEmptyInstance() => create();
  static $pb.PbList<GetTransactionsResponse> createRepeated() => $pb.PbList<GetTransactionsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTransactionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTransactionsResponse>(create);
  static GetTransactionsResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Transaction> get transactions => $_getList(0);
}

class GetPriceResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('GetPriceResponse', package: const $pb.PackageName('chain'), createEmptyInstance: create)
    ..a<$core.double>(1, 'price', $pb.PbFieldType.OD)
    ..hasRequiredFields = false
  ;

  GetPriceResponse._() : super();
  factory GetPriceResponse() => create();
  factory GetPriceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPriceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  GetPriceResponse clone() => GetPriceResponse()..mergeFromMessage(this);
  GetPriceResponse copyWith(void Function(GetPriceResponse) updates) => super.copyWith((message) => updates(message as GetPriceResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GetPriceResponse create() => GetPriceResponse._();
  GetPriceResponse createEmptyInstance() => create();
  static $pb.PbList<GetPriceResponse> createRepeated() => $pb.PbList<GetPriceResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPriceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPriceResponse>(create);
  static GetPriceResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get price => $_getN(0);
  @$pb.TagNumber(1)
  set price($core.double v) { $_setDouble(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPrice() => $_has(0);
  @$pb.TagNumber(1)
  void clearPrice() => clearField(1);
}

