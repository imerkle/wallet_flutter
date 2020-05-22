///
//  Generated code. Do not modify.
//  source: common/timestamp/timestamp.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $2;

class Timestamp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Timestamp', package: const $pb.PackageName('timestamp'), createEmptyInstance: create)
    ..a<$2.Timestamp>(1, 'timestamp', $pb.PbFieldType.OM, defaultOrMaker: $2.Timestamp.getDefault, subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Timestamp._() : super();
  factory Timestamp() => create();
  factory Timestamp.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Timestamp.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Timestamp clone() => Timestamp()..mergeFromMessage(this);
  Timestamp copyWith(void Function(Timestamp) updates) => super.copyWith((message) => updates(message as Timestamp));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Timestamp create() => Timestamp._();
  Timestamp createEmptyInstance() => create();
  static $pb.PbList<Timestamp> createRepeated() => $pb.PbList<Timestamp>();
  static Timestamp getDefault() => _defaultInstance ??= create()..freeze();
  static Timestamp _defaultInstance;

  $2.Timestamp get timestamp => $_getN(0);
  set timestamp($2.Timestamp v) { setField(1, v); }
  $core.bool hasTimestamp() => $_has(0);
  void clearTimestamp() => clearField(1);
}

