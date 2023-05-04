import 'exceptions/username_length_exception.dart';

class Username {
  final String username;

  Username(this.username) {
    if (username.length < 8) {
      throw UsernameLengthException();
    }
  }
}
