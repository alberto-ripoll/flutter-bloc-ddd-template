import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_template/src/utils/http/exceptions/http_request_exception.dart';

import 'package:get_it/get_it.dart';

import '../../../shared/domain/value_objects/username/username.dart';
import 'states/loading_login_state.dart';
import '../../application/login_command.dart';
import '../../domain/entities/user.dart';
import 'events/login_triggered_event.dart';
import 'states/error_login_state.dart';
import 'states/initial_login_state.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../../application/login_command_handler.dart';
import 'states/success_login_state.dart';
import '../../../shared/domain/value_objects/password/exceptions/password_length_exception.dart';
import '../../../shared/domain/value_objects/password/password.dart';
import '../../../shared/domain/value_objects/username/exceptions/username_length_exception.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginCommandHandler loginCommandHandler;

  LoginBloc(this.loginCommandHandler) : super(InitialLoginState()) {
    on<LoginTriggeredEvent>(_login);
  }

  void _login(LoginTriggeredEvent event, Emitter<LoginState> emit) async {
    try {
      emit(LoadingLoginState());

      final User user = await loginCommandHandler(
          LoginCommand(Username(event.username), Password(event.password)));
      emit(SuccessLoginState(user));
    } on UsernameLengthException {
      emit(ErrorLoginState(UsernameLengthException.message));
    } on PasswordLengthException {
      emit(ErrorLoginState(PasswordLengthException.message));
    } on HttpRequestException {
      emit(ErrorLoginState(HttpRequestException.message));
    }
  }
}
