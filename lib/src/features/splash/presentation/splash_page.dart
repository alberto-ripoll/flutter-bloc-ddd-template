import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/router/routes.dart';
import 'bloc/splash_state.dart';
import 'bloc/states/error_splash_state.dart';
import 'bloc/states/success_login_state.dart';
import 'bloc/events/splash_loaded_event.dart';
import 'bloc/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<SplashBloc>().add(SplashLoadedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is SuccessSplashState) {
              Navigator.pushNamed(context, Routes.home);
            } else if (state is ErrorSplashState) {
              Navigator.pushNamed(context, Routes.login);
            }
          },
          child: Column(children: const [
            Center(child: FlutterLogo()),
            CircularProgressIndicator(),
            Text('Trying to log in...')
          ]),
        ),
      ),
    );
  }
}
