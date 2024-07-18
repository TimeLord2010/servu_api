import 'package:servu_api/src/data/models/restaurant.dart';

import 'user.dart';

class Worker extends User {
  Set<Restaurant> restaurants;

  Worker({
    required super.name,
    required super.email,
    required this.restaurants,
  });
}
