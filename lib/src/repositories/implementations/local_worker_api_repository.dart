import 'dart:math';

import 'package:drift/src/runtime/query_builder/query_builder.dart';
import 'package:servu_api/src/data/local_tables/app_database.dart';
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

  SimpleSelectStatement<$LocalWorkerTable, LocalWorkerData> get _select {
    return database.select(database.localWorker);
  }

  Future<LocalWorkerData?> getByEmail(String email) async {
    var query = _select..where((x) => x.email.equals(email));
    var doc = await query.getSingleOrNull();
    return doc;
  }

  @override
  Future<Worker?> login(String email, String password) async {
    _simulateNetworkLatency();
    var worker = await getByEmail(email);
    if (worker != null) {
      return _toWorker(worker);
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

Worker _toWorker(LocalWorkerData data) {
  return Worker(
    email: data.email,
    name: data.name,
    password: data.password,
    restaurants: {},
  );
}
