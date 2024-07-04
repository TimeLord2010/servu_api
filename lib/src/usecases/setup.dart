import 'package:get_it/get_it.dart';

import '../data/local_tables/app_database.dart';

void setup() {
  var appDatabase = AppDatabase();
  GetIt.I.registerSingleton(appDatabase);
}
