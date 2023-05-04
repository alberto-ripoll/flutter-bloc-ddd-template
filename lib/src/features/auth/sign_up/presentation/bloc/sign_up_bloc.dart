import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/value_objects/email.dart';
import '../../../../../utils/http/exceptions/http_request_exception.dart';
import '../../../../shared/user/domain/entities/User.dart';
import '../../../../shared/user/domain/value_objects/password/exceptions/password_length_exception.dart';
import '../../../../shared/user/domain/value_objects/password/password.dart';
import '../../../../shared/user/domain/value_objects/username/username.dart';
import 'states/loading_sign_up_state.dart';
import '../../application/sign_up_command.dart';
import 'events/sign_up_triggered_event.dart';
import 'states/error_sign_up_state.dart';
import 'states/initial_sign_up_state.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';
import '../../application/sign_up_command_handler.dart';
import 'states/success_sign_up_state.dart';
import '../../../../shared/user/domain/value_objects/username/exceptions/username_length_exception.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SingUpCommandHandler singUpCommandHandler;

  SignUpBloc(this.singUpCommandHandler) : super(InitialSignUpState()) {
    on<SignUpTriggeredEvent>(_signUp);
  }

  void _signUp(SignUpTriggeredEvent event, Emitter<SignUpState> emit) async {
    try {
      emit(LoadingSignUpState());

      final User user = await singUpCommandHandler(SingUpCommand(
        Username(event.username),
        Password(event.password),
        Email(event.email),
      ));
      emit(SuccessSignUpState(user));
    } on UsernameLengthException {
      emit(ErrorSignUpState(UsernameLengthException.message));
    } on PasswordLengthException {
      emit(ErrorSignUpState(PasswordLengthException.message));
    } on HttpRequestException {
      emit(ErrorSignUpState(HttpRequestException.message));
    }
  }
}
