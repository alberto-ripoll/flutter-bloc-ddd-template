import '../domain/value_objects/email.dart';
import '../../shared/domain/value_objects/password/password.dart';
import '../../shared/domain/value_objects/username/username.dart';

class SingUpCommand {
  final Username username;
  final Password password;
  final Email email;

  SingUpCommand(this.username, this.password, this.email);
}
