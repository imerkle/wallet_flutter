// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainStore on _MainStore, Store {
  Computed<Coins> _$coinListFromBaseComputed;

  @override
  Coins get coinListFromBase => (_$coinListFromBaseComputed ??=
          Computed<Coins>(() => super.coinListFromBase))
      .value;
  Computed<Coin> _$coinFromRelComputed;

  @override
  Coin get coinFromRel =>
      (_$coinFromRelComputed ??= Computed<Coin>(() => super.coinFromRel)).value;

  final _$initPrepAsyncAction = AsyncAction('initPrep');

  @override
  Future<void> initPrep() {
    return _$initPrepAsyncAction.run(() => super.initPrep());
  }
}
