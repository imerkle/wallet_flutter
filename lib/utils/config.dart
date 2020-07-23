import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallet_flutter/gen/chains/chain/chain.pbenum.dart';
import 'package:wallet_flutter/gen/pb/config.pb.dart';

class ExplorerConfig {
  ExplorerConfig({this.api, this.kind});
  String api;
  String kind;
}

Option updateOptions(Option option, List<FormField> f) {
  f.forEach((e) {
    switch (e.tkind) {
      case TKind.name:
        option.name = e.value;
        break;
      case TKind.ticker:
        option.ticker = e.value;
        break;
      case TKind.precision:
        option.precision = e.value;
        break;
      case TKind.code:
        option.config.code = e.value;
        break;
      case TKind.public:
        option.config.public = e.value;
        break;
      case TKind.private:
        option.config.private = e.value;
        break;
      case TKind.chainId:
        option.config.chainId = e.value;
        break;
      case TKind.protocol:
        option.config.protocol = e.value;
        break;
      case TKind.curveName:
        option.config.curveName = e.value;
        break;
      case TKind.brurl:
        option.brurl = e.value;
        break;
      case TKind.brhash:
        option.brhash = e.value;
        break;
      case TKind.brkind:
        option.brkind = e.value;
        break;
    }
  });
  return option;
}

List<FormField> optionToForm(Option option) {
  return optionToFormGlobal(option).where((e) => !e.global).toList();
}

List<FormField> optionToFormGlobal(Option option) {
  return [
    FormField<String>(
      label: "Name",
      value: option.name,
      tkind: TKind.name,
    ),
    FormField<String>(
      label: "Ticker",
      value: option.ticker,
      tkind: TKind.ticker,
    ),
    FormField<int>(
      label: "Precision",
      value: option.precision,
      kind: FormKind.number,
      tkind: TKind.precision,
    ),
    FormField<int>(
      label: "Code",
      value: option.config.code,
      kind: FormKind.number,
      tkind: TKind.code,
      global: true,
    ),
    FormField<int>(
      label: "Public",
      value: option.config.public,
      kind: FormKind.number,
      tkind: TKind.public,
      global: true,
    ),
    FormField<int>(
      label: "Private",
      value: option.config.private,
      kind: FormKind.number,
      tkind: TKind.private,
      global: true,
    ),
    FormField<int>(
      label: "Chain Id",
      value: option.config.chainId,
      kind: FormKind.number,
      tkind: TKind.chainId,
      global: true,
    ),
    FormField<Protocol>(
      label: "Protocol",
      value: option.config.protocol,
      kind: FormKind.list,
      tkind: TKind.protocol,
      global: true,
    ),
    FormField<CurveName>(
      label: "Curve Name",
      value: option.config.curveName,
      kind: FormKind.list,
      tkind: TKind.curveName,
      global: true,
    ),
    FormField<String>(
      label: "Br URL",
      value: option.brurl,
      tkind: TKind.brurl,
    ),
    FormField<String>(
      label: "Br Hash",
      value: option.brhash,
      tkind: TKind.brhash,
    ),
    FormField<GetBalanceRequestKind>(
      label: "Br Kind",
      value: option.brkind,
      kind: FormKind.list,
      tkind: TKind.brkind,
    ),
  ];
}

class FormField<T> {
  FormField({
    this.kind = FormKind.string,
    @required this.value,
    @required this.label,
    this.tkind,
    this.global = false,
  });
  FormKind kind;
  T value;
  String label;
  TKind tkind;
  bool global;
}

enum TKind {
  protocol,
  curveName,
  brkind,

  //not lists
  name,
  ticker,
  precision,
  code,
  public,
  private,
  chainId,
  brurl,
  brhash,
}
enum FormKind {
  number,
  string,
  list,
}
