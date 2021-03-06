///
//  Generated code. Do not modify.
//  source: chains/chain/chain.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'chain.pb.dart' as $0;
export 'chain.pb.dart';

class ChainServiceClient extends $grpc.Client {
  static final _$getBalance =
      $grpc.ClientMethod<$0.GetBalanceRequest, $0.GetBalanceResponse>(
          '/chain.ChainService/GetBalance',
          ($0.GetBalanceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetBalanceResponse.fromBuffer(value));
  static final _$getPrice =
      $grpc.ClientMethod<$0.GetPriceRequest, $0.GetPriceResponse>(
          '/chain.ChainService/GetPrice',
          ($0.GetPriceRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetPriceResponse.fromBuffer(value));
  static final _$getTransactions =
      $grpc.ClientMethod<$0.GetTransactionsRequest, $0.GetTransactionsResponse>(
          '/chain.ChainService/GetTransactions',
          ($0.GetTransactionsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetTransactionsResponse.fromBuffer(value));

  ChainServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.GetBalanceResponse> getBalance(
      $0.GetBalanceRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getBalance, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.GetPriceResponse> getPrice($0.GetPriceRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getPrice, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.GetTransactionsResponse> getTransactions(
      $0.GetTransactionsRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getTransactions, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class ChainServiceBase extends $grpc.Service {
  $core.String get $name => 'chain.ChainService';

  ChainServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetBalanceRequest, $0.GetBalanceResponse>(
        'GetBalance',
        getBalance_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBalanceRequest.fromBuffer(value),
        ($0.GetBalanceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPriceRequest, $0.GetPriceResponse>(
        'GetPrice',
        getPrice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPriceRequest.fromBuffer(value),
        ($0.GetPriceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetTransactionsRequest,
            $0.GetTransactionsResponse>(
        'GetTransactions',
        getTransactions_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetTransactionsRequest.fromBuffer(value),
        ($0.GetTransactionsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetBalanceResponse> getBalance_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetBalanceRequest> request) async {
    return getBalance(call, await request);
  }

  $async.Future<$0.GetPriceResponse> getPrice_Pre(
      $grpc.ServiceCall call, $async.Future<$0.GetPriceRequest> request) async {
    return getPrice(call, await request);
  }

  $async.Future<$0.GetTransactionsResponse> getTransactions_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetTransactionsRequest> request) async {
    return getTransactions(call, await request);
  }

  $async.Future<$0.GetBalanceResponse> getBalance(
      $grpc.ServiceCall call, $0.GetBalanceRequest request);
  $async.Future<$0.GetPriceResponse> getPrice(
      $grpc.ServiceCall call, $0.GetPriceRequest request);
  $async.Future<$0.GetTransactionsResponse> getTransactions(
      $grpc.ServiceCall call, $0.GetTransactionsRequest request);
}
