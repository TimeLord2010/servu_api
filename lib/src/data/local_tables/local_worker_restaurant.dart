import 'package:drift/drift.dart';

class LocalWorkerRestaurant extends Table {
  IntColumn get workerId => integer()();

  IntColumn get restaurantId => integer()();

  TextColumn get roles => text()();

  @override
  Set<Column> get primaryKey => {workerId, restaurantId};
}
