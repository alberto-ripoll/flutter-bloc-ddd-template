import 'package:flutter_ddd_template/src/features/auth/sign_up/domain/value_objects/email.dart';

import '../../../shared/domain/value_objects/username/username.dart';
import '../../../shared/domain/value_objects/password/password.dart';
import '../entities/user.dart';

abstract class SignUpRepositoryInterface {
  Future<User> signUp(Username username, Email email, Password password);
}
