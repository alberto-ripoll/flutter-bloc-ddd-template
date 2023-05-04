import 'package:injectable/injectable.dart';

import '../../../../shared/user/domain/entities/User.dart';
import '../../domain/value_objects/email.dart';
import '../../../../../utils/http/http_client.dart';
import '../../../../shared/user/domain/value_objects/password/password.dart';
import '../../../../shared/user/domain/value_objects/username/username.dart';
import '../../domain/interfaces/sign_up_repository_interface.dart';

@Injectable(as: SignUpRepositoryInterface)
class SignUpRepository implements SignUpRepositoryInterface {
  SignUpRepository();

  @override
  Future<User> signUp(Username username, Email email, Password password) async {
    try {
      final response = await HttpClient().get('https://randomuser.me/api/');
      return User(username: Username(response.body));
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
