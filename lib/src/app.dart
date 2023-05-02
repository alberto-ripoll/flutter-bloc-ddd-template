import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/login/application/login_command_handler.dart';
import 'core/router/routes.dart';
import 'features/auth/login/presentation/login_page.dart';
import 'features/auth/login/presentation/bloc/login_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.routes,
      title: 'Flutter DDD Template',
      home: BlocProvider(
          create: (context) =>
              LoginBloc(GetIt.instance.get<LoginCommandHandler>()),
          child: const LoginPage()),
    );
  }
}
