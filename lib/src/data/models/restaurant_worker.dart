import 'package:servu_api/src/data/enums/worker_role.dart';

class RestaurantWorker {
  String userId;
  List<WorkerRole> roles;

  RestaurantWorker({
    required this.userId,
    required this.roles,
  });
}
