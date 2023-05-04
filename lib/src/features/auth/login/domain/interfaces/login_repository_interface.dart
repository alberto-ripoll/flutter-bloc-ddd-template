import '../../../../shared/user/domain/entities/User.dart';
import '../../../../shared/user/domain/value_objects/password/password.dart';
import '../../../../shared/user/domain/value_objects/username/username.dart';

abstract class LoginRepositoryInterface {
  Future<User> login(Username username, Password password);
}
