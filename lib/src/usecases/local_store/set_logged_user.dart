import 'package:servu_api/src/factories/create_local_store_repository.dart';

import '../../data/models/user.dart';

Future<void> setLoggedUser(User? user) async {
  var localStore = createLocalStoreRepository();
  await localStore.setLoggedUser(user);
}
