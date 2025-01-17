import 'package:servu_api/src/data/errors/serv_error.dart';

import '../../data/models/user.dart';
import '../../factories/create_user_repository.dart';

Future<User> loginUser(String email, String password) async {
  var rep = createUserRepository();
  var user = await rep.login(email, password);
  if (user == null) {
    throw ServError('Credentials did not match');
  }
  return user;
}
