import 'package:drift/drift.dart';
import 'package:servu_api/src/data/local_tables/app_database.dart';
import 'package:servu_api/src/data/models/user.dart';
import 'package:servu_api/src/repositories/models/local_store_model.dart';

class LocalStoreRepository extends LocalStoreModel {
  final AppDatabase database;

  LocalStoreRepository(this.database);

  @override
  Future<User?> getLoggedUser() async {
    var query = await database.select(database.loggedUser).getSingleOrNull();
    return _getUser(query);
  }

  @override
  Future<void> setLoggedUser(User? user) async {
    if (user == null) {
      await database.delete(database.loggedUser).go();
      return;
    }
    var data = LoggedUserCompanion.insert(
      email: user.email,
      name: Value(user.name),
    );
    await database.into(database.loggedUser).insert(data);
  }
}

User? _getUser(LoggedUserData? data) {
  if (data == null) return null;
  return User(
    name: data.name,
    email: data.email,
  );
}
