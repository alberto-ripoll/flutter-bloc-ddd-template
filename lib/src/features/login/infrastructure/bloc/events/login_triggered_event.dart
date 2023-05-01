import '../login_event.dart';

class LoginTriggeredEvent extends LoginEvent {
  final String username;
  final String password;

  LoginTriggeredEvent(this.username, this.password);
}
