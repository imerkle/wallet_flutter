import 'package:grpc/grpc.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'log.g.dart';

// This is the class used by rest of your codebase
class LogStore = _LogStore with _$LogStore;

abstract class _LogStore with Store {
  ObservableList<GrpcError> grpcErrors = ObservableList<GrpcError>();

  @action
  void addGrpc(GrpcError err) {
    grpcErrors.add(err);
  }
}
