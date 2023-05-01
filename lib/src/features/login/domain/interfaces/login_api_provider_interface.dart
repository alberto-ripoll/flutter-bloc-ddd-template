import 'package:injectable/injectable.dart';

import '../../../../utils/http/api_response.dart';

// @injectable
abstract class LoginApiProviderInterface {
  Future<ApiResponse> login(String username, String password);
}
