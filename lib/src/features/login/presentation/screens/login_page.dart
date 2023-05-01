import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infrastructure/bloc/events/login_triggered_event.dart';
import '../../../../constants/app_sizes.dart';
import '../../infrastructure/bloc/login_state.dart';
import '../../infrastructure/bloc/login_bloc.dart';
import '../../infrastructure/bloc/states/error_login_state.dart';
import '../../infrastructure/bloc/states/loading_login_state.dart';
import '../../infrastructure/bloc/states/success_login_state.dart';
import '../widgets/login_input_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (_, state) {
              if (state is LoadingLoginState) {
                return const CircularProgressIndicator();
              } else if (state is SuccessLoginState) {
                return Text('Logged in as ${state.user.username} :)');
              } else if (state is ErrorLoginState) {
                return Text('Error: ${state.errorMessage}');
              } else {
                return Column(
                  children: [
                    LoginInputField(
                      controller: usernameController,
                      hintText: "Email",
                    ),
                    gapH16,
                    LoginInputField(
                      controller: passwordController,
                      hintText: "Password",
                    ),
                    gapH20,
                    ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        context.read<LoginBloc>().add(LoginTriggeredEvent(
                            usernameController.text, passwordController.text));
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
