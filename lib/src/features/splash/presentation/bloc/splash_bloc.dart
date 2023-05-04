import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/user/domain/entities/User.dart';
import 'states/success_login_state.dart';
import '../../application/auto_login_command.dart';
import 'events/splash_loaded_event.dart';
import 'states/error_splash_state.dart';
import 'states/initial_splash_state.dart';
import 'splash_event.dart';
import 'splash_state.dart';
import '../../application/auto_login_command_handler.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AutoLoginCommandHandler loginCommandHandler;

  SplashBloc(this.loginCommandHandler) : super(InitialSplashState()) {
    on<SplashLoadedEvent>(_tryToLogin);
  }

  void _tryToLogin(SplashLoadedEvent event, Emitter<SplashState> emit) async {
    try {
      sleep(const Duration(seconds: 3));
      final user = await loginCommandHandler(AutoLoginCommand());
      emit(SuccessSplashState(User(username: user.username)));
    } on Exception {
      emit(ErrorSplashState());
    }
  }
}
