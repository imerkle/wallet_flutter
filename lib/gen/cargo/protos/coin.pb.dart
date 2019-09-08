///
//  Generated code. Do not modify.
//  source: cargo/protos/coin.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core show bool, Deprecated, double, int, List, Map, override, pragma, String;

import 'package:protobuf/protobuf.dart' as $pb;

class Coin extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Coin')
    ..a<$core.List<$core.int>>(1, 'publicKey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, 'privateKey', $pb.PbFieldType.OY)
    ..aOS(3, 'wif')
    ..aOS(4, 'address')
    ..aOS(5, 'rel')
    ..aOS(6, 'base')
    ..hasRequiredFields = false
  ;

  Coin._() : super();
  factory Coin() => create();
  factory Coin.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Coin.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Coin clone() => Coin()..mergeFromMessage(this);
  Coin copyWith(void Function(Coin) updates) => super.copyWith((message) => updates(message as Coin));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Coin create() => Coin._();
  Coin createEmptyInstance() => create();
  static $pb.PbList<Coin> createRepeated() => $pb.PbList<Coin>();
  static Coin getDefault() => _defaultInstance ??= create()..freeze();
  static Coin _defaultInstance;

  $core.List<$core.int> get publicKey => $_getN(0);
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  $core.bool hasPublicKey() => $_has(0);
  void clearPublicKey() => clearField(1);

  $core.List<$core.int> get privateKey => $_getN(1);
  set privateKey($core.List<$core.int> v) { $_setBytes(1, v); }
  $core.bool hasPrivateKey() => $_has(1);
  void clearPrivateKey() => clearField(2);

  $core.String get wif => $_getS(2, '');
  set wif($core.String v) { $_setString(2, v); }
  $core.bool hasWif() => $_has(2);
  void clearWif() => clearField(3);

  $core.String get address => $_getS(3, '');
  set address($core.String v) { $_setString(3, v); }
  $core.bool hasAddress() => $_has(3);
  void clearAddress() => clearField(4);

  $core.String get rel => $_getS(4, '');
  set rel($core.String v) { $_setString(4, v); }
  $core.bool hasRel() => $_has(4);
  void clearRel() => clearField(5);

  $core.String get base => $_getS(5, '');
  set base($core.String v) { $_setString(5, v); }
  $core.bool hasBase() => $_has(5);
  void clearBase() => clearField(6);
}

class Coins extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Coins')
    ..pc<Coin>(1, 'coin', $pb.PbFieldType.PM,Coin.create)
    ..aOS(2, 'base')
    ..hasRequiredFields = false
  ;

  Coins._() : super();
  factory Coins() => create();
  factory Coins.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Coins.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Coins clone() => Coins()..mergeFromMessage(this);
  Coins copyWith(void Function(Coins) updates) => super.copyWith((message) => updates(message as Coins));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Coins create() => Coins._();
  Coins createEmptyInstance() => create();
  static $pb.PbList<Coins> createRepeated() => $pb.PbList<Coins>();
  static Coins getDefault() => _defaultInstance ??= create()..freeze();
  static Coins _defaultInstance;

  $core.List<Coin> get coin => $_getList(0);

  $core.String get base => $_getS(1, '');
  set base($core.String v) { $_setString(1, v); }
  $core.bool hasBase() => $_has(1);
  void clearBase() => clearField(2);
}

class Ticker extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Ticker')
    ..pPS(1, 'rel')
    ..aOS(2, 'base')
    ..hasRequiredFields = false
  ;

  Ticker._() : super();
  factory Ticker() => create();
  factory Ticker.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ticker.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Ticker clone() => Ticker()..mergeFromMessage(this);
  Ticker copyWith(void Function(Ticker) updates) => super.copyWith((message) => updates(message as Ticker));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Ticker create() => Ticker._();
  Ticker createEmptyInstance() => create();
  static $pb.PbList<Ticker> createRepeated() => $pb.PbList<Ticker>();
  static Ticker getDefault() => _defaultInstance ??= create()..freeze();
  static Ticker _defaultInstance;

  $core.List<$core.String> get rel => $_getList(0);

  $core.String get base => $_getS(1, '');
  set base($core.String v) { $_setString(1, v); }
  $core.bool hasBase() => $_has(1);
  void clearBase() => clearField(2);
}

class Tickers extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Tickers')
    ..pc<Ticker>(1, 'list', $pb.PbFieldType.PM,Ticker.create)
    ..hasRequiredFields = false
  ;

  Tickers._() : super();
  factory Tickers() => create();
  factory Tickers.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tickers.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Tickers clone() => Tickers()..mergeFromMessage(this);
  Tickers copyWith(void Function(Tickers) updates) => super.copyWith((message) => updates(message as Tickers));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Tickers create() => Tickers._();
  Tickers createEmptyInstance() => create();
  static $pb.PbList<Tickers> createRepeated() => $pb.PbList<Tickers>();
  static Tickers getDefault() => _defaultInstance ??= create()..freeze();
  static Tickers _defaultInstance;

  $core.List<Ticker> get list => $_getList(0);
}

class CoinsList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('CoinsList')
    ..pc<Coins>(1, 'list', $pb.PbFieldType.PM,Coins.create)
    ..hasRequiredFields = false
  ;

  CoinsList._() : super();
  factory CoinsList() => create();
  factory CoinsList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CoinsList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  CoinsList clone() => CoinsList()..mergeFromMessage(this);
  CoinsList copyWith(void Function(CoinsList) updates) => super.copyWith((message) => updates(message as CoinsList));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CoinsList create() => CoinsList._();
  CoinsList createEmptyInstance() => create();
  static $pb.PbList<CoinsList> createRepeated() => $pb.PbList<CoinsList>();
  static CoinsList getDefault() => _defaultInstance ??= create()..freeze();
  static CoinsList _defaultInstance;

  $core.List<Coins> get list => $_getList(0);
}

class Wallet extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Wallet')
    ..aOS(1, 'mnemonic')
    ..a<CoinsList>(2, 'coinsList', $pb.PbFieldType.OM, CoinsList.getDefault, CoinsList.create)
    ..hasRequiredFields = false
  ;

  Wallet._() : super();
  factory Wallet() => create();
  factory Wallet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Wallet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Wallet clone() => Wallet()..mergeFromMessage(this);
  Wallet copyWith(void Function(Wallet) updates) => super.copyWith((message) => updates(message as Wallet));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Wallet create() => Wallet._();
  Wallet createEmptyInstance() => create();
  static $pb.PbList<Wallet> createRepeated() => $pb.PbList<Wallet>();
  static Wallet getDefault() => _defaultInstance ??= create()..freeze();
  static Wallet _defaultInstance;

  $core.String get mnemonic => $_getS(0, '');
  set mnemonic($core.String v) { $_setString(0, v); }
  $core.bool hasMnemonic() => $_has(0);
  void clearMnemonic() => clearField(1);

  CoinsList get coinsList => $_getN(1);
  set coinsList(CoinsList v) { setField(2, v); }
  $core.bool hasCoinsList() => $_has(1);
  void clearCoinsList() => clearField(2);
}

class Wallets extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Wallets')
    ..pc<Wallet>(1, 'list', $pb.PbFieldType.PM,Wallet.create)
    ..hasRequiredFields = false
  ;

  Wallets._() : super();
  factory Wallets() => create();
  factory Wallets.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Wallets.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Wallets clone() => Wallets()..mergeFromMessage(this);
  Wallets copyWith(void Function(Wallets) updates) => super.copyWith((message) => updates(message as Wallets));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Wallets create() => Wallets._();
  Wallets createEmptyInstance() => create();
  static $pb.PbList<Wallets> createRepeated() => $pb.PbList<Wallets>();
  static Wallets getDefault() => _defaultInstance ??= create()..freeze();
  static Wallets _defaultInstance;

  $core.List<Wallet> get list => $_getList(0);
}

class Output extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Output')
    ..aOS(1, 'address')
    ..a<$core.double>(2, 'value', $pb.PbFieldType.OD)
    ..aOS(3, 'memo')
    ..hasRequiredFields = false
  ;

  Output._() : super();
  factory Output() => create();
  factory Output.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Output.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Output clone() => Output()..mergeFromMessage(this);
  Output copyWith(void Function(Output) updates) => super.copyWith((message) => updates(message as Output));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Output create() => Output._();
  Output createEmptyInstance() => create();
  static $pb.PbList<Output> createRepeated() => $pb.PbList<Output>();
  static Output getDefault() => _defaultInstance ??= create()..freeze();
  static Output _defaultInstance;

  $core.String get address => $_getS(0, '');
  set address($core.String v) { $_setString(0, v); }
  $core.bool hasAddress() => $_has(0);
  void clearAddress() => clearField(1);

  $core.double get value => $_getN(1);
  set value($core.double v) { $_setDouble(1, v); }
  $core.bool hasValue() => $_has(1);
  void clearValue() => clearField(2);

  $core.String get memo => $_getS(2, '');
  set memo($core.String v) { $_setString(2, v); }
  $core.bool hasMemo() => $_has(2);
  void clearMemo() => clearField(3);
}

class Outputs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Outputs')
    ..pc<Output>(1, 'list', $pb.PbFieldType.PM,Output.create)
    ..hasRequiredFields = false
  ;

  Outputs._() : super();
  factory Outputs() => create();
  factory Outputs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Outputs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Outputs clone() => Outputs()..mergeFromMessage(this);
  Outputs copyWith(void Function(Outputs) updates) => super.copyWith((message) => updates(message as Outputs));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Outputs create() => Outputs._();
  Outputs createEmptyInstance() => create();
  static $pb.PbList<Outputs> createRepeated() => $pb.PbList<Outputs>();
  static Outputs getDefault() => _defaultInstance ??= create()..freeze();
  static Outputs _defaultInstance;

  $core.List<Output> get list => $_getList(0);
}

class Tx extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Tx')
    ..aOS(1, 'txHex')
    ..hasRequiredFields = false
  ;

  Tx._() : super();
  factory Tx() => create();
  factory Tx.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Tx.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Tx clone() => Tx()..mergeFromMessage(this);
  Tx copyWith(void Function(Tx) updates) => super.copyWith((message) => updates(message as Tx));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Tx create() => Tx._();
  Tx createEmptyInstance() => create();
  static $pb.PbList<Tx> createRepeated() => $pb.PbList<Tx>();
  static Tx getDefault() => _defaultInstance ??= create()..freeze();
  static Tx _defaultInstance;

  $core.String get txHex => $_getS(0, '');
  set txHex($core.String v) { $_setString(0, v); }
  $core.bool hasTxHex() => $_has(0);
  void clearTxHex() => clearField(1);
}

