import '../../../../../shared/user/domain/entities/User.dart';
import '../login_state.dart';

class SuccessLoginState extends LoginState {
  final User user;

  SuccessLoginState(this.user);
}
