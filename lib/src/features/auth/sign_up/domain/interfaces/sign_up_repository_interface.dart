import '../../../../shared/user/domain/entities/User.dart';
import '../../../../shared/user/domain/value_objects/password/password.dart';
import '../value_objects/email.dart';
import '../../../../shared/user/domain/value_objects/username/username.dart';

abstract class SignUpRepositoryInterface {
  Future<User> signUp(Username username, Email email, Password password);
}
