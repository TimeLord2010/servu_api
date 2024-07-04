import 'package:get_it/get_it.dart';
import 'package:servu_api/src/data/local_tables/app_database.dart';
import 'package:servu_api/src/repositories/implementations/local_store_repository.dart';

LocalStoreRepository createLocalStoreRepository() {
  var app = GetIt.I.get<AppDatabase>();
  return LocalStoreRepository(app);
}
