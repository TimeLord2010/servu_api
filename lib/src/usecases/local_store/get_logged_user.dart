import 'package:servu_api/src/factories/create_local_store_repository.dart';

import '../../data/models/user.dart';

Future<User?> getLoggedUser() async {
  var localStore = createLocalStoreRepository();
  var user = await localStore.getLoggedUser();
  return user;
}
