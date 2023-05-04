import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_template/src/features/auth/login/application/login_command_handler.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/login/presentation/bloc/login_bloc.dart';

import '../../features/home/presentation/screens/home_page.dart';
import '../../features/auth/login/presentation/login_page.dart';
import '../../features/splash/application/auto_login_command_handler.dart';
import '../../features/splash/presentation/bloc/splash_bloc.dart';
import '../../features/splash/presentation/splash_page.dart';

class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomePage(),
    login: (context) => BlocProvider(
          create: (context) =>
              LoginBloc(GetIt.instance.get<LoginCommandHandler>()),
          child: const LoginPage(),
        ),
    splash: (context) => BlocProvider(
          create: (context) =>
              SplashBloc(GetIt.instance.get<AutoLoginCommandHandler>()),
          child: const SplashPage(),
        ),
  };
}
