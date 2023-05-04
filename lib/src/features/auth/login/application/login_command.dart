import '../../../shared/user/domain/value_objects/password/password.dart';
import '../../../shared/user/domain/value_objects/username/username.dart';

class LoginCommand {
  final Username username;
  final Password password;

  LoginCommand(this.username, this.password);
}
