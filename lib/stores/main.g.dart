// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainStore on _MainStore, Store {
  final _$fiatAtom = Atom(name: '_MainStore.fiat');

  @override
  Fiat get fiat {
    _$fiatAtom.reportRead();
    return super.fiat;
  }

  @override
  set fiat(Fiat value) {
    _$fiatAtom.reportWrite(value, super.fiat, () {
      super.fiat = value;
    });
  }

  final _$initPrepAsyncAction = AsyncAction('_MainStore.initPrep');

  @override
  Future<void> initPrep() {
    return _$initPrepAsyncAction.run(() => super.initPrep());
  }

  @override
  String toString() {
    return '''
fiat: ${fiat}
    ''';
  }
}
