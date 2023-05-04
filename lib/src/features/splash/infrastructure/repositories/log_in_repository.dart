import 'package:injectable/injectable.dart';

import '../../../auth/login/application/login_command.dart';
import '../../../auth/login/application/login_command_handler.dart';
import '../../../shared/user/domain/value_objects/username/username.dart';
import '../../domain/interfaces/log_in_repository_interface.dart';
import '../../../shared/user/domain/entities/User.dart';
import '../../../shared/user/domain/value_objects/password/password.dart';

@Injectable(as: LogInRepositoryInterface)
class LogInRepository implements LogInRepositoryInterface {
  final LoginCommandHandler loginCommandHandler;

  LogInRepository(this.loginCommandHandler);

  @override
  Future<User> login(Username username, Password password) async {
    try {
      final loginCommand = LoginCommand(username, password);
      final user = await loginCommandHandler.call(loginCommand);

      return User(username: user.username);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
