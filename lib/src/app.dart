import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/splash/presentation/bloc/splash_bloc.dart';
import 'features/splash/presentation/splash_page.dart';
import 'package:get_it/get_it.dart';
import 'features/splash/application/auto_login_command_handler.dart';
import 'core/router/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.routes,
      title: 'Flutter DDD Template',
      home: BlocProvider(
          create: (context) =>
              SplashBloc(GetIt.instance.get<AutoLoginCommandHandler>()),
          child: const SplashPage()),
    );
  }
}
