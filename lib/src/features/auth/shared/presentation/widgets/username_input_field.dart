import 'package:flutter/material.dart';

import '../../../login/domain/service/login_form_validator_service.dart';

class UsernameInputField extends StatelessWidget {
  const UsernameInputField({
    super.key,
    required this.usernameController,
  });

  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        value = value ?? '';
        return validateUsername(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: usernameController,
      decoration: const InputDecoration.collapsed(hintText: "Username"),
    );
  }
}
