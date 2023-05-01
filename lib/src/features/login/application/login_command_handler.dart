import 'package:flutter_ddd_template/src/features/login/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

import 'login_command.dart';
import '../domain/interfaces/login_repository_interface.dart';

@injectable
class LoginCommandHandler {
  final LoginRepositoryInterface repository;

  LoginCommandHandler(this.repository);

  Future<User> call(LoginCommand loginCommand) async {
    final User user =
        await repository.login(loginCommand.username, loginCommand.password);

    return user;
  }
}
