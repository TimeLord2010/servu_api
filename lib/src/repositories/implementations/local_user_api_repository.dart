import 'package:drift/drift.dart';

import '../../data/local_tables/app_database.dart';
import '../../data/models/user.dart';
import '../models/user_api_model.dart';

class LocalUserApiRepository implements UserApiModel {
  final AppDatabase database;

  LocalUserApiRepository(this.database);

  InsertStatement<$LocalUserTable, LocalUserData> get wCollection {
    var col = database.into(database.localUser);
    return col;
  }

  @override
  Future<User> register(String name, String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 600));
    var exists = await emailExists(email);
    if (exists) {
      throw Exception('Email is already registered');
    }
    await wCollection.insert(LocalUserCompanion.insert(
      email: email,
      password: password,
    ));
    return User(
      name: name,
      email: email,
    );
  }

  @override
  Future<bool> emailExists(String email) async {
    var doc = await getByEmail(email);
    return doc != null;
  }

  @override
  Future<User?> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 600));
    var doc = await getByEmail(email);
    if (doc == null) {
      return null;
    }
    if (doc.password != password) {
      return null;
    }
    return doc;
  }

  @override
  Future<User?> getByEmail(String email) async {
    var query = database.select(database.localUser)..where((x) => x.email.equals(email));
    var doc = await query.getSingleOrNull();
    return _toMaybeUser(doc);
  }
}

User? _toMaybeUser(LocalUserData? data) {
  if (data == null) return null;
  return toUser(data);
}

User toUser(LocalUserData data) {
  return User(
    name: data.name ?? '',
    email: data.email,
    password: data.password,
  );
}
