///
//  Generated code. Do not modify.
//  source: chains/chain/chain.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class TransactionKind extends $pb.ProtobufEnum {
  static const TransactionKind TRANSFER = TransactionKind._(0, 'TRANSFER');

  static const $core.List<TransactionKind> values = <TransactionKind> [
    TRANSFER,
  ];

  static final $core.Map<$core.int, TransactionKind> _byValue = $pb.ProtobufEnum.initByValue(values);
  static TransactionKind valueOf($core.int value) => _byValue[value];

  const TransactionKind._($core.int v, $core.String n) : super(v, n);
}

class Direction extends $pb.ProtobufEnum {
  static const Direction OUTGOING = Direction._(0, 'OUTGOING');
  static const Direction INCOMING = Direction._(1, 'INCOMING');
  static const Direction SELF = Direction._(2, 'SELF');

  static const $core.List<Direction> values = <Direction> [
    OUTGOING,
    INCOMING,
    SELF,
  ];

  static final $core.Map<$core.int, Direction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Direction valueOf($core.int value) => _byValue[value];

  const Direction._($core.int v, $core.String n) : super(v, n);
}

class GetBalanceRequestKind extends $pb.ProtobufEnum {
  static const GetBalanceRequestKind BLOCKBOOK = GetBalanceRequestKind._(0, 'BLOCKBOOK');
  static const GetBalanceRequestKind ETH_ERC20 = GetBalanceRequestKind._(1, 'ETH_ERC20');
  static const GetBalanceRequestKind VET = GetBalanceRequestKind._(2, 'VET');
  static const GetBalanceRequestKind NANO = GetBalanceRequestKind._(3, 'NANO');
  static const GetBalanceRequestKind XRP = GetBalanceRequestKind._(4, 'XRP');
  static const GetBalanceRequestKind NEO = GetBalanceRequestKind._(6, 'NEO');
  static const GetBalanceRequestKind ONT = GetBalanceRequestKind._(7, 'ONT');
  static const GetBalanceRequestKind EOS = GetBalanceRequestKind._(8, 'EOS');
  static const GetBalanceRequestKind TRX = GetBalanceRequestKind._(10, 'TRX');
  static const GetBalanceRequestKind BNB = GetBalanceRequestKind._(11, 'BNB');
  static const GetBalanceRequestKind ONT_OEP4 = GetBalanceRequestKind._(12, 'ONT_OEP4');
  static const GetBalanceRequestKind ONT_OEP5 = GetBalanceRequestKind._(13, 'ONT_OEP5');
  static const GetBalanceRequestKind ONT_OEP8 = GetBalanceRequestKind._(14, 'ONT_OEP8');
  static const GetBalanceRequestKind XLM = GetBalanceRequestKind._(15, 'XLM');

  static const $core.List<GetBalanceRequestKind> values = <GetBalanceRequestKind> [
    BLOCKBOOK,
    ETH_ERC20,
    VET,
    NANO,
    XRP,
    NEO,
    ONT,
    EOS,
    TRX,
    BNB,
    ONT_OEP4,
    ONT_OEP5,
    ONT_OEP8,
    XLM,
  ];

  static final $core.Map<$core.int, GetBalanceRequestKind> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GetBalanceRequestKind valueOf($core.int value) => _byValue[value];

  const GetBalanceRequestKind._($core.int v, $core.String n) : super(v, n);
}

