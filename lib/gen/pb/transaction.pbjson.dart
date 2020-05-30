///
//  Generated code. Do not modify.
//  source: pb/transaction.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const Input$json = const {
  '1': 'Input',
  '2': const [
    const {'1': 'vout', '3': 1, '4': 1, '5': 13, '10': 'vout'},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'value', '3': 3, '4': 1, '5': 4, '10': 'value'},
  ],
};

const Output$json = const {
  '1': 'Output',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'value', '3': 2, '4': 1, '5': 4, '10': 'value'},
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

const TxOpts$json = const {
  '1': 'TxOpts',
  '2': const [
    const {'1': 'inputs', '3': 1, '4': 3, '5': 11, '6': '.Input', '10': 'inputs'},
    const {'1': 'nonce', '3': 2, '4': 1, '5': 4, '10': 'nonce'},
  ],
};

const GenSendTransactionRequest$json = const {
  '1': 'GenSendTransactionRequest',
  '2': const [
    const {'1': 'config', '3': 1, '4': 1, '5': 11, '6': '.config.Config', '10': 'config'},
    const {'1': 'private_key', '3': 2, '4': 1, '5': 12, '10': 'privateKey'},
    const {'1': 'public_key', '3': 3, '4': 1, '5': 12, '10': 'publicKey'},
    const {'1': 'outputs', '3': 4, '4': 1, '5': 11, '6': '.Outputs', '10': 'outputs'},
    const {'1': 'tx_opts', '3': 5, '4': 1, '5': 11, '6': '.TxOpts', '10': 'txOpts'},
  ],
};

