import '../data/enums/operations_mode.dart';
import '../data/static/configuration.dart';
import '../repositories/implementations/local_home_api_repository.dart';

LocalHomeApiRepository createHomeApiRepository() {
  return switch (Configuration.mode) {
    OperationsMode.offline => _createOffline(),
    OperationsMode.online => throw UnimplementedError(),
  };
}

LocalHomeApiRepository _createOffline() {
  return LocalHomeApiRepository();
}
