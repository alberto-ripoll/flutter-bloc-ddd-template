import 'package:flutter/material.dart';

import '../../../login/domain/service/login_form_validator_service.dart';

class PasswordInputField extends StatelessWidget {
  const PasswordInputField({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        value = value ?? '';
        return validatePassword(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: passwordController,
      decoration: const InputDecoration.collapsed(hintText: "Password"),
    );
  }
}
