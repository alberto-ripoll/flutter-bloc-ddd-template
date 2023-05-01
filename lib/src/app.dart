import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_template/src/features/login/presentation/screens/login_page.dart';

import 'features/login/infrastructure/bloc/login_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DDD Template',
      home: BlocProvider(
          create: (context) => LoginBloc(), child: const LoginPage()),
    );
  }
}
