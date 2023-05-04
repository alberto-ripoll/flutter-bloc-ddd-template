import '../../../shared/user/domain/value_objects/username/username.dart';
import '../../../shared/user/domain/value_objects/password/password.dart';

abstract class LoggedUserRepositoryInterface {
  Future<Username> getLoggedUsername();
  Future<Password> getStoredPassword();
}
