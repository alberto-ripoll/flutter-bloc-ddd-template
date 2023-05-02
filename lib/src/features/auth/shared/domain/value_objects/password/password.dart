import 'exceptions/password_length_exception.dart';

class Password {
  final String password;

  Password(this.password) {
    if (password.length < 6) {
      throw PasswordLengthException();
    }
  }
}
