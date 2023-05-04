import 'package:injectable/injectable.dart';

import '../../shared/user/domain/entities/User.dart';
import '../domain/interfaces/log_in_repository_interface.dart';
import '../domain/interfaces/logged_user_repository_interface.dart';
import 'auto_login_command.dart';

@injectable
class AutoLoginCommandHandler {
  final LogInRepositoryInterface repository;
  final LoggedUserRepositoryInterface loggedUserRepository;

  AutoLoginCommandHandler(this.repository, this.loggedUserRepository);

  Future<User> call(AutoLoginCommand loginCommand) async {
    final username = await loggedUserRepository.getLoggedUsername();
    final password = await loggedUserRepository.getStoredPassword();

    final User loggedUser = await repository.login(username, password);
    return loggedUser;
  }
}
