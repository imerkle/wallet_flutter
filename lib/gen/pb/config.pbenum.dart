///
//  Generated code. Do not modify.
//  source: pb/config.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Protocol extends $pb.ProtobufEnum {
  static const Protocol BTC = Protocol._(0, 'BTC');
  static const Protocol BTC_BECH32 = Protocol._(1, 'BTC_BECH32');
  static const Protocol ETH = Protocol._(2, 'ETH');
  static const Protocol EOS = Protocol._(3, 'EOS');
  static const Protocol XLM = Protocol._(4, 'XLM');
  static const Protocol XRP = Protocol._(5, 'XRP');
  static const Protocol NEO = Protocol._(6, 'NEO');

  static const $core.List<Protocol> values = <Protocol> [
    BTC,
    BTC_BECH32,
    ETH,
    EOS,
    XLM,
    XRP,
    NEO,
  ];

  static final $core.Map<$core.int, Protocol> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Protocol valueOf($core.int value) => _byValue[value];

  const Protocol._($core.int v, $core.String n) : super(v, n);
}

class CurveName extends $pb.ProtobufEnum {
  static const CurveName SECP256K1 = CurveName._(0, 'SECP256K1');
  static const CurveName SECP256R1 = CurveName._(1, 'SECP256R1');
  static const CurveName ED25519 = CurveName._(2, 'ED25519');

  static const $core.List<CurveName> values = <CurveName> [
    SECP256K1,
    SECP256R1,
    ED25519,
  ];

  static final $core.Map<$core.int, CurveName> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CurveName valueOf($core.int value) => _byValue[value];

  const CurveName._($core.int v, $core.String n) : super(v, n);
}

