import 'package:flutter_ddd_template/src/features/login/infrastructure/repositories/login_api_provider.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/user.dart';
import '../../domain/interfaces/login_api_provider_interface.dart';
import '../../domain/interfaces/login_repository_interface.dart';

@Injectable(as: LoginRepositoryInterface)
class LoginRepository implements LoginRepositoryInterface {
  final LoginApiProviderInterface apiProvider;

  LoginRepository(this.apiProvider);

  @override
  Future<User> login(String username, String password) async {
    try {
      final response = await apiProvider.login(username, password);
      return User(username: response.body);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
