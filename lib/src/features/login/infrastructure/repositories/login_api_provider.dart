import 'package:injectable/injectable.dart';

import '../../../../utils/http/api_response.dart';
import '../../../../utils/http/http_client.dart';
import '../../domain/interfaces/login_api_provider_interface.dart';

@Injectable(as: LoginApiProviderInterface)
class LoginApiProvider implements LoginApiProviderInterface {
  LoginApiProvider();

  @override
  Future<ApiResponse> login(String username, String password) async {
    try {
      final response = await HttpClient().get('https://randomuser.me/api/');
      return ApiResponse(body: response.body, statusCode: response.statusCode);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
