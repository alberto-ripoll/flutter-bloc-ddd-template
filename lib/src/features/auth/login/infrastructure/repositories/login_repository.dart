import 'package:injectable/injectable.dart';

import '../../../../../utils/http/http_client.dart';
import '../../../shared/domain/value_objects/password/password.dart';
import '../../../shared/domain/value_objects/username/username.dart';
import '../../domain/entities/user.dart';
import '../../domain/interfaces/login_repository_interface.dart';

@Injectable(as: LoginRepositoryInterface)
class LoginRepository implements LoginRepositoryInterface {
  LoginRepository();

  @override
  Future<User> login(Username username, Password password) async {
    try {
      final response = await HttpClient().get('https://randomuser.me/api/');
      return User(username: Username(response.body));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
