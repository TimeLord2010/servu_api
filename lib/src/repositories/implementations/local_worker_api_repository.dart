import 'dart:math';

import 'package:drift/src/runtime/query_builder/query_builder.dart';
import 'package:servu_api/src/data/enums/worker_role.dart';
import 'package:servu_api/src/data/local_tables/app_database.dart';
import 'package:servu_api/src/data/models/restaurant.dart';
import 'package:servu_api/src/data/models/restaurant_worker.dart';
import 'package:servu_api/src/data/models/worker.dart';
import 'package:servu_api/src/repositories/models/worker_api_model.dart';

class LocalWorkerApiRepository extends WorkerApiModel {
  AppDatabase database;

  LocalWorkerApiRepository(this.database);

  Future<void> _simulateNetworkLatency() async {
    var random = Random();
    int mili = switch (random.nextDouble()) {
      < 0.1 => 2000,
      < 0.3 => 1000,
      < 0.5 => 500,
      _ => 100,
    };
    await Future.delayed(Duration(
      milliseconds: 300 + mili,
    ));
  }

  SimpleSelectStatement<$LocalWorkerTable, LocalWorkerData> get _workerSelect {
    return database.select(database.localWorker);
  }

  SimpleSelectStatement<$LocalWorkerRestaurantTable, LocalWorkerRestaurantData> get _workerRestaurant {
    return database.select(database.localWorkerRestaurant);
  }

  Future<LocalWorkerData?> getByEmail(String email) async {
    var query = _workerSelect..where((x) => x.email.equals(email));
    var doc = await query.getSingleOrNull();
    return doc;
  }

  @override
  Future<Worker?> login(String email, String password) async {
    _simulateNetworkLatency();
    var worker = await getByEmail(email);
    if (worker != null) {
      var query = _workerRestaurant..where((x) => x.workerId.equals(worker.id));
      var docs = await query.get();
      var restaurantWorker = docs.map(_toRestaurantWorker);
      return _toWorker(worker, restaurantWorker);
    }
    return null;
  }

  @override
  Future<Worker> register(String email, String password) {
    _simulateNetworkLatency();
    throw UnimplementedError();
  }

  @override
  Future<bool> isEmailRegistered(String email) {
    // TODO: implement isEmailRegistered
    throw UnimplementedError();
  }
}

Worker _toWorker(LocalWorkerData data, Iterable<RestaurantWorker> restaurants) {
  return Worker(
    email: data.email,
    name: data.name,
    password: data.password,
    restaurants: restaurants.map((x) {
      return Restaurant(
        id: x.restaurantId,
      );
    }).toSet(),
  );
}

RestaurantWorker _toRestaurantWorker(LocalWorkerRestaurantData data) {
  var rolesIndexes = data.roles.split(',').map((x) => x.trim());
  var roles = rolesIndexes.map((x) {
    var index = int.tryParse(x);
    if (index == null) return null;
    return WorkerRole.values[index];
  }).whereType<WorkerRole>();
  return RestaurantWorker(
    userId: data.workerId.toString(),
    restaurantId: data.restaurantId.toString(),
    roles: roles.toSet(),
  );
}
