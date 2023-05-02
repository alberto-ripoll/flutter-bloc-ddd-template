import '../../../shared/domain/value_objects/username/username.dart';
import '../../../shared/domain/value_objects/password/password.dart';
import '../entities/user.dart';

abstract class LoginRepositoryInterface {
  Future<User> login(Username username, Password password);
}
