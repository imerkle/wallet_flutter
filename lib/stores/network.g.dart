// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NetworkStore on _NetworkStore, Store {
  final _$hasInternetAtom = Atom(name: '_NetworkStore.hasInternet');

  @override
  bool get hasInternet {
    _$hasInternetAtom.reportRead();
    return super.hasInternet;
  }

  @override
  set hasInternet(bool value) {
    _$hasInternetAtom.reportWrite(value, super.hasInternet, () {
      super.hasInternet = value;
    });
  }

  @override
  String toString() {
    return '''
hasInternet: ${hasInternet}
    ''';
  }
}
