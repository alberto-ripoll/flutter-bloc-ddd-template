import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_template/src/features/auth/sign_up/presentation/bloc/events/sign_up_triggered_event.dart';
import 'package:flutter_ddd_template/src/features/auth/sign_up/presentation/bloc/sign_up_state.dart';
import 'package:flutter_ddd_template/src/features/auth/sign_up/presentation/bloc/states/error_sign_up_state.dart';
import 'package:flutter_ddd_template/src/features/auth/sign_up/presentation/bloc/states/initial_sign_up_state.dart';
import 'package:flutter_ddd_template/src/features/auth/sign_up/presentation/bloc/states/success_sign_up_state.dart';

import '../../shared/presentation/widgets/password_input_field.dart';
import 'bloc/sign_up_bloc.dart';
import '../../shared/presentation/widgets/username_input_field.dart';
import '../../../../core/router/routes.dart';
import '../../../../constants/app_sizes.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<SignUpBloc, SignUpState>(
            listener: (_, state) {
              if (state is SuccessSignUpState) {
                Navigator.pushNamed(context, Routes.home);
              } else if (state is ErrorSignUpState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (_, state) {
              if (state is InitialSignUpState || state is ErrorSignUpState) {
                return const SignUpForm();
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

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key, loginError, passwordError});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Column(
      children: [
        UsernameInputField(usernameController: usernameController),
        gapH16,
        UsernameInputField(usernameController: usernameController),
        PasswordInputField(passwordController: passwordController),
        gapH20,
        ElevatedButton(
          child: const Text('Sign Up'),
          onPressed: () {
            context.read<SignUpBloc>().add(SignUpTriggeredEvent(
                (usernameController.text),
                (emailController.text),
                (passwordController.text)));
          },
        ),
      ],
    );
  }
}
