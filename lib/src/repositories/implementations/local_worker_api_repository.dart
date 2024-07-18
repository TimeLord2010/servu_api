import 'package:servu_api/src/data/models/worker.dart';
import 'package:servu_api/src/repositories/models/worker_api_model.dart';

class LocalWorkerApiRepository extends WorkerApiModel {
  @override
  Future<Worker> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Worker> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
