import 'package:flutter/material.dart';

import '../../../login/domain/service/login_form_validator_service.dart';

class ConfirmPasswordInputField extends StatelessWidget {
  const ConfirmPasswordInputField({
    super.key,
    required this.passwordController,
    required this.confirmedPasswordController,
  });

  final TextEditingController passwordController;
  final TextEditingController confirmedPasswordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        value = value ?? '';
        return validateConfirmedPassword(passwordController.text, value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: confirmedPasswordController,
      decoration: const InputDecoration.collapsed(hintText: "Password"),
    );
  }
}
