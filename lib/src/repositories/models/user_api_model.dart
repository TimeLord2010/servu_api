import '../../data/models/user.dart';

abstract class UserApiModel {
  Future<User?> getByEmail(String email);

  Future<bool> emailExists(String email);

  Future<User> register(String name, String email, String password);

  Future<User?> login(String email, String password);
}
