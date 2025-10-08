import 'dart:developer';

import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          log("Login successful.", name: "Login API");
        }
      },
      label: Text('Login'),
      icon: Icon(Icons.login_rounded),
    );
  }
}
