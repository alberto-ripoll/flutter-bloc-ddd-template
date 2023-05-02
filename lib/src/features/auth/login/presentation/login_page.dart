import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/presentation/widgets/password_input_field.dart';
import '../../shared/presentation/widgets/username_input_field.dart';
import 'bloc/states/initial_login_state.dart';
import '../../../../core/router/routes.dart';
import 'bloc/events/login_triggered_event.dart';
import '../../../../constants/app_sizes.dart';
import 'bloc/login_state.dart';
import 'bloc/login_bloc.dart';
import 'bloc/states/error_login_state.dart';
import 'bloc/states/success_login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (_, state) {
              if (state is SuccessLoginState) {
                Navigator.pushNamed(context, Routes.home);
              } else if (state is ErrorLoginState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (_, state) {
              if (state is InitialLoginState || state is ErrorLoginState) {
                return const LoginForm();
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, loginError, passwordError});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    return Column(
      children: [
        UsernameInputField(usernameController: usernameController),
        gapH16,
        PasswordInputField(passwordController: passwordController),
        gapH20,
        ElevatedButton(
          child: const Text('Login'),
          onPressed: () {
            context.read<LoginBloc>().add(LoginTriggeredEvent(
                (usernameController.text), (passwordController.text)));
          },
        ),
      ],
    );
  }
}
