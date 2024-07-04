import 'package:get_it/get_it.dart';

import '../data/enums/operations_mode.dart';
import '../data/local_tables/app_database.dart';
import '../data/static/configuration.dart';
import '../repositories/implementations/local_user_api_repository.dart';
import '../repositories/models/user_api_model.dart';

UserApiModel createUserRepository() {
  return switch (Configuration.mode) {
    OperationsMode.offline => _createOffline(),
    OperationsMode.online => throw UnimplementedError(),
  };
}

UserApiModel _createOffline() {
  var appDatabase = GetIt.I.get<AppDatabase>();
  return LocalUserApiRepository(appDatabase);
}
