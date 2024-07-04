import '../../data/models/user.dart';
import '../../factories/create_user_repository.dart';

Future<User> registerUser({
  required String name,
  required String email,
  required String password,
}) async {
  // Validations

  // Name validation
  if (name.length > 50) {
    throw Exception('Name is too long');
  }

  // Email validation
  if (email.isEmpty) {
    throw Exception('Email is empty');
  }

  // Password validation
  if (password.length < 6) {
    throw Exception('Password is too short');
  }
  if (password.length > 30) {
    throw Exception('Password is too long');
  }

  var rep = createUserRepository();
  var user = await rep.register(name, email, password);
  return user;
}
