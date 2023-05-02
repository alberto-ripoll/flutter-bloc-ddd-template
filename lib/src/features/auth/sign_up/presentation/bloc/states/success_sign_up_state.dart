import '../../../domain/entities/user.dart';
import '../sign_up_state.dart';

class SuccessSignUpState extends SignUpState {
  final User user;

  SuccessSignUpState(this.user);
}
