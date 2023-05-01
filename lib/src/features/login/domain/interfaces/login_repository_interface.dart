import 'package:flutter_ddd_template/src/features/login/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

// @injectable
abstract class LoginRepositoryInterface {
  Future<User> login(String username, String password);
}
