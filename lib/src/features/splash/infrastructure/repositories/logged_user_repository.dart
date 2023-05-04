import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../domain/exceptions/credentials_not_found_exception.dart';
import '../../domain/interfaces/logged_user_repository_interface.dart';
import '../../../shared/user/domain/value_objects/username/username.dart';
import '../../../shared/user/domain/value_objects/password/password.dart';

@Injectable(as: LoggedUserRepositoryInterface)
class LoggedUserRepository implements LoggedUserRepositoryInterface {
  LoggedUserRepository();

  @override
  Future<Username> getLoggedUsername() async {
    const storage = FlutterSecureStorage();
    final String? username = await storage.read(key: 'username');
    if (username == null) {
      throw CredentialsNotFoundException();
    }
    return Username(username);
  }

  @override
  Future<Password> getStoredPassword() async {
    const storage = FlutterSecureStorage();
    final String? password = await storage.read(key: 'password');
    if (password == null) {
      throw CredentialsNotFoundException();
    }
    return Password(password);
  }
}
