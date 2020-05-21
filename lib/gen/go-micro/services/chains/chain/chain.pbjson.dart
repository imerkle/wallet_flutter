///
//  Generated code. Do not modify.
//  source: go-micro/services/chains/chain/chain.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const TransactionKind$json = const {
  '1': 'TransactionKind',
  '2': const [
    const {'1': 'TRANSFER', '2': 0},
  ],
};

const Direction$json = const {
  '1': 'Direction',
  '2': const [
    const {'1': 'OUTGOING', '2': 0},
    const {'1': 'INCOMING', '2': 1},
    const {'1': 'SELF', '2': 2},
  ],
};

const GetBalanceRequestKind$json = const {
  '1': 'GetBalanceRequestKind',
  '2': const [
    const {'1': 'BLOCKBOOK', '2': 0},
    const {'1': 'ETH_ERC20', '2': 1},
    const {'1': 'VET', '2': 2},
    const {'1': 'NANO', '2': 3},
    const {'1': 'XRP', '2': 4},
    const {'1': 'NEO', '2': 6},
    const {'1': 'ONT', '2': 7},
    const {'1': 'EOS', '2': 8},
    const {'1': 'TRX', '2': 10},
    const {'1': 'BNB', '2': 11},
    const {'1': 'ONT_OEP4', '2': 12},
    const {'1': 'ONT_OEP5', '2': 13},
    const {'1': 'ONT_OEP8', '2': 14},
    const {'1': 'XLM', '2': 15},
  ],
};

const Input$json = const {
  '1': 'Input',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'value', '3': 2, '4': 1, '5': 3, '10': 'value'},
  ],
};

const Gas$json = const {
  '1': 'Gas',
  '2': const [
    const {'1': 'used', '3': 1, '4': 1, '5': 5, '10': 'used'},
    const {'1': 'price', '3': 2, '4': 1, '5': 5, '10': 'price'},
  ],
};

const Transaction$json = const {
  '1': 'Transaction',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'inputs', '3': 2, '4': 3, '5': 11, '6': '.chain.Input', '10': 'inputs'},
    const {'1': 'outputs', '3': 3, '4': 3, '5': 11, '6': '.chain.Input', '10': 'outputs'},
    const {'1': 'kind', '3': 4, '4': 1, '5': 14, '6': '.chain.TransactionKind', '10': 'kind'},
    const {'1': 'direction', '3': 5, '4': 1, '5': 14, '6': '.chain.Direction', '10': 'direction'},
    const {'1': 'fees', '3': 6, '4': 1, '5': 3, '10': 'fees'},
    const {'1': 'confimations', '3': 7, '4': 1, '5': 5, '10': 'confimations'},
    const {'1': 'timestamp', '3': 8, '4': 1, '5': 11, '6': '.timestamp.Timestamp', '10': 'timestamp'},
  ],
};

const Balance$json = const {
  '1': 'Balance',
  '2': const [
    const {'1': 'unlocked', '3': 1, '4': 1, '5': 3, '10': 'unlocked'},
    const {'1': 'locked', '3': 2, '4': 1, '5': 3, '10': 'locked'},
  ],
};

const BalanceNormalized$json = const {
  '1': 'BalanceNormalized',
  '2': const [
    const {'1': 'unlocked', '3': 1, '4': 1, '5': 1, '10': 'unlocked'},
    const {'1': 'locked', '3': 2, '4': 1, '5': 1, '10': 'locked'},
  ],
};

const GetBalanceRequest$json = const {
  '1': 'GetBalanceRequest',
  '2': const [
    const {'1': 'kind', '3': 1, '4': 1, '5': 14, '6': '.chain.GetBalanceRequestKind', '10': 'kind'},
    const {'1': 'api', '3': 2, '4': 1, '5': 9, '10': 'api'},
    const {'1': 'address', '3': 3, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'hash', '3': 4, '4': 1, '5': 9, '10': 'hash'},
    const {'1': 'precision', '3': 5, '4': 1, '5': 3, '10': 'precision'},
  ],
};

const GetBalanceResponse$json = const {
  '1': 'GetBalanceResponse',
  '2': const [
    const {'1': 'balance', '3': 1, '4': 1, '5': 11, '6': '.chain.Balance', '10': 'balance'},
    const {'1': 'balance_normalized', '3': 2, '4': 1, '5': 11, '6': '.chain.BalanceNormalized', '10': 'balanceNormalized'},
  ],
};

const GetPriceRequest$json = const {
  '1': 'GetPriceRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

const GetPriceResponse$json = const {
  '1': 'GetPriceResponse',
  '2': const [
    const {'1': 'price', '3': 1, '4': 1, '5': 1, '10': 'price'},
  ],
};

