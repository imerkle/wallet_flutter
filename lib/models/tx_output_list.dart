import 'package:wallet_flutter/models/tx_output.dart';

class TxOutputList {
  final List<TxOutput> tx_outputs;

  TxOutputList({
    this.tx_outputs,
  });
  
  factory TxOutputList.fromJson(List<dynamic> parsedJson) {
    List<TxOutput> tx_outputs = new List<TxOutput>();
    tx_outputs = parsedJson.map((i)=> TxOutput.fromJson(i)).toList();
    return new TxOutputList(
       tx_outputs: tx_outputs,
    );
  }
  Map<String, dynamic> toJson() => {
    "tx_outputs": tx_outputs,
  };    
}