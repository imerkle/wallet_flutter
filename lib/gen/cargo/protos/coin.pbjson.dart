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
  ],
};

const Coins$json = const {
  '1': 'Coins',
  '2': const [
    const {'1': 'list', '3': 1, '4': 3, '5': 11, '6': '.Coin', '10': 'list'},
    const {'1': 'base', '3': 2, '4': 1, '5': 9, '10': 'base'},
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

const Config$json = const {
  '1': 'Config',
  '2': const [
    const {'1': 'rel', '3': 1, '4': 1, '5': 9, '10': 'rel'},
    const {'1': 'protocol', '3': 2, '4': 1, '5': 9, '10': 'protocol'},
    const {'1': 'code', '3': 3, '4': 1, '5': 13, '10': 'code'},
    const {'1': 'precision', '3': 4, '4': 1, '5': 13, '10': 'precision'},
    const {'1': 'private', '3': 5, '4': 1, '5': 13, '10': 'private'},
    const {'1': 'public', '3': 6, '4': 1, '5': 13, '10': 'public'},
    const {'1': 'prefix', '3': 7, '4': 1, '5': 9, '10': 'prefix'},
    const {'1': 'chain_id', '3': 8, '4': 1, '5': 13, '10': 'chainId'},
    const {'1': 'base', '3': 9, '4': 1, '5': 9, '10': 'base'},
    const {'1': 'curve_name', '3': 10, '4': 1, '5': 9, '10': 'curveName'},
    const {'1': 'is_compressed', '3': 11, '4': 1, '5': 8, '10': 'isCompressed'},
    const {'1': 'is_bech32', '3': 12, '4': 1, '5': 8, '10': 'isBech32'},
  ],
};

const Configs$json = const {
  '1': 'Configs',
  '2': const [
    const {'1': 'list', '3': 1, '4': 3, '5': 11, '6': '.Config', '10': 'list'},
  ],
};

const Input$json = const {
  '1': 'Input',
  '2': const [
    const {'1': 'vout', '3': 1, '4': 1, '5': 13, '10': 'vout'},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'value', '3': 3, '4': 1, '5': 4, '10': 'value'},
  ],
};

const TxOpts$json = const {
  '1': 'TxOpts',
  '2': const [
    const {'1': 'inputs', '3': 1, '4': 3, '5': 11, '6': '.Input', '10': 'inputs'},
    const {'1': 'nonce', '3': 2, '4': 1, '5': 4, '10': 'nonce'},
  ],
};

const GetWalletInput$json = const {
  '1': 'GetWalletInput',
  '2': const [
    const {'1': 'mnemonic', '3': 1, '4': 1, '5': 9, '10': 'mnemonic'},
    const {'1': 'configs', '3': 2, '4': 1, '5': 11, '6': '.Configs', '10': 'configs'},
  ],
};

const GenSendTxInput$json = const {
  '1': 'GenSendTxInput',
  '2': const [
    const {'1': 'config', '3': 1, '4': 1, '5': 11, '6': '.Config', '10': 'config'},
    const {'1': 'private_key', '3': 2, '4': 1, '5': 12, '10': 'privateKey'},
    const {'1': 'public_key', '3': 3, '4': 1, '5': 12, '10': 'publicKey'},
    const {'1': 'outputs', '3': 4, '4': 1, '5': 11, '6': '.Outputs', '10': 'outputs'},
    const {'1': 'tx_opts', '3': 5, '4': 1, '5': 11, '6': '.TxOpts', '10': 'txOpts'},
  ],
};

const WebPlatformChannel$json = const {
  '1': 'WebPlatformChannel',
  '2': const [
    const {'1': 'method_name', '3': 1, '4': 1, '5': 9, '10': 'methodName'},
    const {'1': 'input', '3': 2, '4': 1, '5': 12, '10': 'input'},
  ],
};

