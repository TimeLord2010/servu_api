import 'package:servu_api/src/data/enums/worker_role.dart';

class RestaurantWorker {
  String userId;
  String restaurantId;
  Set<WorkerRole> roles;

  RestaurantWorker({
    required this.restaurantId,
    required this.userId,
    required this.roles,
  });
}
