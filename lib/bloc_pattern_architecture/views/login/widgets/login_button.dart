import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login/login_bloc.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => false,
      builder: (context, state) {
        return ElevatedButton.icon(
          onPressed: () {
            if (formKey.currentState!.validate()) {

            }
          },
          label: Text('Login'),
          icon: Icon(Icons.login_rounded),
        );
      },
    );
  }
}
