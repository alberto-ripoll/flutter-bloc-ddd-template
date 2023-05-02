import '../sign_up_event.dart';

class SignUpTriggeredEvent extends SignUpEvent {
  final String username;
  final String email;
  final String password;

  SignUpTriggeredEvent(this.username, this.email, this.password);
}
