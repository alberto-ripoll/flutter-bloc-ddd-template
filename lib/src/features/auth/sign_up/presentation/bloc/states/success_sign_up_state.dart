import '../../../../../shared/user/domain/entities/User.dart';
import '../sign_up_state.dart';

class SuccessSignUpState extends SignUpState {
  final User user;

  SuccessSignUpState(this.user);
}
