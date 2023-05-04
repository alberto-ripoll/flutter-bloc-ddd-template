import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/events/sign_up_triggered_event.dart';
import 'bloc/sign_up_state.dart';
import 'bloc/states/error_sign_up_state.dart';
import 'bloc/states/initial_sign_up_state.dart';
import 'bloc/states/success_sign_up_state.dart';
import 'widgets/confirm_password_input_field.dart';
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
    final confirmedPasswordController = TextEditingController();

    return Column(
      children: [
        UsernameInputField(usernameController: usernameController),
        gapH16,
        PasswordInputField(passwordController: passwordController),
        gapW4,
        ConfirmPasswordInputField(
          passwordController: passwordController,
          confirmedPasswordController: confirmedPasswordController,
        ),
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
