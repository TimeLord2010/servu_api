import 'package:servu_api/src/data/models/restaurant_worker.dart';

class Restaurant {
  final String id;
  String name;
  List<RestaurantWorker>? workers;

  Restaurant({
    required this.id,
    required this.name,
    this.workers,
  });
}
