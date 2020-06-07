@JS("wasm_bindgen")
library wasm_interop;

import 'dart:typed_data';

import 'package:js/js.dart';
//import 'package:universal_html/prefer_universal/js.dart' as js;

external Uint8List get_wallet(Uint8List obj);
