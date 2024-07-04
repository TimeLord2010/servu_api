import '../../data/models/user.dart';

abstract class LocalStoreModel {
  Future<User?> getLoggedUser();

  Future<void> setLoggedUser(User? user);
}
