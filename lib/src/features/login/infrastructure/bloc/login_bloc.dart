import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState()) {
    on<LoginTriggeredEvent>(_login);
  }

  void _login(LoginTriggeredEvent event, Emitter<LoginState> emit) async {
    try {
      emit(LoadingLoginState());
      final LoginCommandHandler loginUseCase =
          GetIt.instance.get<LoginCommandHandler>();
      final User user =
          await loginUseCase(LoginCommand(event.username, event.password));
      emit(SuccessLoginState(user));
    } catch (e) {
      emit(ErrorLoginState(e.toString()));
    }
  }
}
