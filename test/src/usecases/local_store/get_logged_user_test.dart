import 'package:servu_api/src/data/models/user.dart';
import 'package:servu_api/src/usecases/local_store/get_logged_user.dart';
import 'package:servu_api/src/usecases/local_store/set_logged_user.dart';
import 'package:servu_api/src/usecases/setup.dart';
import 'package:test/test.dart';

void main() {
  var user = User(
    name: 'Test user',
    email: 'test.local.user@gmail.com',
    password: 'Password1',
  );
  setUpAll(() async {
    setup();
    await setLoggedUser(user);
  });
  tearDownAll(() async {
    await setLoggedUser(null);
  });
  test('get logged user', () async {
    var savedUser = await getLoggedUser();
    expect(savedUser, isNot(null));
    expect(savedUser!.name, user.name);
    expect(savedUser.name, user.name);
    expect(savedUser.password, null);

    await setLoggedUser(null);

    savedUser = await getLoggedUser();
    expect(savedUser, null);
  });
}
