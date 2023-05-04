import '../../../../shared/user/domain/value_objects/password/exceptions/password_length_exception.dart';
import '../../../../shared/user/domain/value_objects/password/password.dart';
import '../../../../shared/user/domain/value_objects/username/exceptions/username_length_exception.dart';
import '../../../../shared/user/domain/value_objects/username/username.dart';

String? validateUsername(String username) {
  try {
    Username(username);
    return null;
  } on UsernameLengthException {
    return UsernameLengthException.message;
  }
}

String? validatePassword(String password) {
  try {
    Password(password);
    return null;
  } on PasswordLengthException {
    return PasswordLengthException.message;
  }
}
