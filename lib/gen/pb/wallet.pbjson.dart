///
//  Generated code. Do not modify.
//  source: pb/wallet.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const WalletKind$json = const {
  '1': 'WalletKind',
  '2': const [
    const {'1': 'BIP32', '2': 0},
  ],
};

const Wallet$json = const {
  '1': 'Wallet',
  '2': const [
    const {'1': 'mnemonic', '3': 1, '4': 1, '5': 9, '10': 'mnemonic'},
    const {'1': 'coinkeys', '3': 2, '4': 3, '5': 11, '6': '.Wallet.CoinkeysEntry', '10': 'coinkeys'},
    const {'1': 'wallet_kind', '3': 3, '4': 1, '5': 14, '6': '.WalletKind', '10': 'walletKind'},
    const {'1': 'options', '3': 4, '4': 3, '5': 11, '6': '.Wallet.OptionsEntry', '10': 'options'},
  ],
  '3': const [Wallet_CoinkeysEntry$json, Wallet_OptionsEntry$json],
};

const Wallet_CoinkeysEntry$json = const {
  '1': 'CoinkeysEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.CoinKey', '10': 'value'},
  ],
  '7': const {'7': true},
};

const Wallet_OptionsEntry$json = const {
  '1': 'OptionsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.config.Option', '10': 'value'},
  ],
  '7': const {'7': true},
};

const CoinKey$json = const {
  '1': 'CoinKey',
  '2': const [
    const {'1': 'public_key', '3': 1, '4': 1, '5': 12, '10': 'publicKey'},
    const {'1': 'private_key', '3': 2, '4': 1, '5': 12, '10': 'privateKey'},
    const {'1': 'wif', '3': 3, '4': 1, '5': 9, '10': 'wif'},
    const {'1': 'address', '3': 4, '4': 1, '5': 9, '10': 'address'},
  ],
};

const Wallets$json = const {
  '1': 'Wallets',
  '2': const [
    const {'1': 'list', '3': 1, '4': 3, '5': 11, '6': '.Wallet', '10': 'list'},
  ],
};

const GetWalletsRequest$json = const {
  '1': 'GetWalletsRequest',
  '2': const [
    const {'1': 'mnemonic', '3': 1, '4': 1, '5': 9, '10': 'mnemonic'},
    const {'1': 'configs', '3': 2, '4': 1, '5': 11, '6': '.config.Configs', '10': 'configs'},
  ],
};

