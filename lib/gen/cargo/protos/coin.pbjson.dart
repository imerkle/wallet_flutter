///
//  Generated code. Do not modify.
//  source: cargo/protos/coin.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Coin$json = const {
  '1': 'Coin',
  '2': const [
    const {'1': 'public_key', '3': 1, '4': 1, '5': 12, '10': 'publicKey'},
    const {'1': 'private_key', '3': 2, '4': 1, '5': 12, '10': 'privateKey'},
    const {'1': 'wif', '3': 3, '4': 1, '5': 9, '10': 'wif'},
    const {'1': 'address', '3': 4, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'rel', '3': 5, '4': 1, '5': 9, '10': 'rel'},
    const {'1': 'base', '3': 6, '4': 1, '5': 9, '10': 'base'},
  ],
};

const Coins$json = const {
  '1': 'Coins',
  '2': const [
    const {'1': 'coin', '3': 1, '4': 3, '5': 11, '6': '.Coin', '10': 'coin'},
    const {'1': 'base', '3': 2, '4': 1, '5': 9, '10': 'base'},
  ],
};

const Ticker$json = const {
  '1': 'Ticker',
  '2': const [
    const {'1': 'rel', '3': 1, '4': 3, '5': 9, '10': 'rel'},
    const {'1': 'base', '3': 2, '4': 1, '5': 9, '10': 'base'},
  ],
};

const Tickers$json = const {
  '1': 'Tickers',
  '2': const [
    const {'1': 'list', '3': 1, '4': 3, '5': 11, '6': '.Ticker', '10': 'list'},
  ],
};

const CoinsList$json = const {
  '1': 'CoinsList',
  '2': const [
    const {'1': 'list', '3': 1, '4': 3, '5': 11, '6': '.Coins', '10': 'list'},
  ],
};

const Wallet$json = const {
  '1': 'Wallet',
  '2': const [
    const {'1': 'mnemonic', '3': 1, '4': 1, '5': 9, '10': 'mnemonic'},
    const {'1': 'coins_list', '3': 2, '4': 1, '5': 11, '6': '.CoinsList', '10': 'coinsList'},
  ],
};

const Wallets$json = const {
  '1': 'Wallets',
  '2': const [
    const {'1': 'list', '3': 1, '4': 3, '5': 11, '6': '.Wallet', '10': 'list'},
  ],
};

const Output$json = const {
  '1': 'Output',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'value', '3': 2, '4': 1, '5': 1, '10': 'value'},
    const {'1': 'memo', '3': 3, '4': 1, '5': 9, '10': 'memo'},
  ],
};

const Outputs$json = const {
  '1': 'Outputs',
  '2': const [
    const {'1': 'list', '3': 1, '4': 3, '5': 11, '6': '.Output', '10': 'list'},
  ],
};

const Tx$json = const {
  '1': 'Tx',
  '2': const [
    const {'1': 'tx_hex', '3': 1, '4': 1, '5': 9, '10': 'txHex'},
  ],
};

