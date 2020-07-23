///
//  Generated code. Do not modify.
//  source: pb/config.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Protocol$json = const {
  '1': 'Protocol',
  '2': const [
    const {'1': 'BTC', '2': 0},
    const {'1': 'BTC_BECH32', '2': 1},
    const {'1': 'ETH', '2': 2},
    const {'1': 'EOS', '2': 3},
    const {'1': 'XLM', '2': 4},
    const {'1': 'XRP', '2': 5},
    const {'1': 'NEO', '2': 6},
  ],
};

const CurveName$json = const {
  '1': 'CurveName',
  '2': const [
    const {'1': 'SECP256K1', '2': 0},
    const {'1': 'SECP256R1', '2': 1},
    const {'1': 'ED25519', '2': 2},
  ],
};

const Config$json = const {
  '1': 'Config',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'protocol', '3': 2, '4': 1, '5': 14, '6': '.config.Protocol', '10': 'protocol'},
    const {'1': 'code', '3': 3, '4': 1, '5': 13, '10': 'code'},
    const {'1': 'private', '3': 4, '4': 1, '5': 13, '10': 'private'},
    const {'1': 'public', '3': 5, '4': 1, '5': 13, '10': 'public'},
    const {'1': 'prefix', '3': 6, '4': 1, '5': 9, '10': 'prefix'},
    const {'1': 'curve_name', '3': 7, '4': 1, '5': 14, '6': '.config.CurveName', '10': 'curveName'},
    const {'1': 'chain_id', '3': 8, '4': 1, '5': 13, '10': 'chainId'},
  ],
};

const Configs$json = const {
  '1': 'Configs',
  '2': const [
    const {'1': 'list', '3': 1, '4': 3, '5': 11, '6': '.config.Config', '10': 'list'},
  ],
};

const Option$json = const {
  '1': 'Option',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'ticker', '3': 2, '4': 1, '5': 9, '10': 'ticker'},
    const {'1': 'config', '3': 3, '4': 1, '5': 11, '6': '.config.Config', '10': 'config'},
    const {'1': 'precision', '3': 4, '4': 1, '5': 5, '10': 'precision'},
    const {'1': 'id', '3': 5, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'brkind', '3': 6, '4': 1, '5': 14, '6': '.chain.GetBalanceRequestKind', '10': 'brkind'},
    const {'1': 'brhash', '3': 7, '4': 1, '5': 9, '10': 'brhash'},
    const {'1': 'brurl', '3': 8, '4': 1, '5': 9, '10': 'brurl'},
  ],
};

const WebPlatformChannel$json = const {
  '1': 'WebPlatformChannel',
  '2': const [
    const {'1': 'method_name', '3': 1, '4': 1, '5': 9, '10': 'methodName'},
    const {'1': 'input', '3': 2, '4': 1, '5': 12, '10': 'input'},
  ],
};

