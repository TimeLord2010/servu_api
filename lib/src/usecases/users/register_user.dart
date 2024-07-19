import 'package:servu_api/src/data/errors/serv_validation_error.dart';

import '../../data/models/user.dart';
import '../../factories/create_user_repository.dart';

/// Saves a email and password so the user can login and use the application
/// as a restaurant client.
///
/// If there is a issue with any of the input fields, the function will throw
/// a [ServValidationError]. This includes duplicate email.
Future<User> registerUser({
  required String name,
  required String email,
  required String password,
}) async {
  // Validations

  // Name validation
  if (name.length > 50) {
    throw ServValidationError('Name', 'is too long');
  }

  // Email validation
  if (email.isEmpty) {
    throw ServValidationError('Email', 'is empty');
  }

  // Password validation
  if (password.length < 6) {
    throw ServValidationError('Password', 'is too short');
  }
  if (password.length > 30) {
    throw ServValidationError('Password', 'is too long');
  }

  var rep = createUserRepository();

  var emailExists = await rep.emailExists(email);
  if (emailExists) {
    throw ServValidationError('Email', 'is already in user');
  }

  var user = await rep.register(name, email, password);
  return user;
}
