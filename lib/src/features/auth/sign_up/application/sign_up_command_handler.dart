import 'package:injectable/injectable.dart';

import 'sign_up_command.dart';
import '../domain/entities/user.dart';
import '../domain/interfaces/sign_up_repository_interface.dart';

@injectable
class SingUpCommandHandler {
  final SignUpRepositoryInterface repository;

  SingUpCommandHandler(this.repository);

  Future<User> call(SingUpCommand loginCommand) async {
    final User user = await repository.signUp(
        loginCommand.username, loginCommand.email, (loginCommand.password));

    return user;
  }
}
