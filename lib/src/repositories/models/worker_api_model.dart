import 'package:servu_api/src/data/models/worker.dart';

abstract class WorkerApiModel {
  Future<Worker?> login(String email, String password);

  Future<Worker> register(String email, String password);

  Future<bool> isEmailRegistered(String email);
}
