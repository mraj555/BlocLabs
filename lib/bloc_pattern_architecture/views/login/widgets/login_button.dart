import 'dart:developer';

import 'package:bloclabs/bloc_pattern_architecture/utils/enums.dart';
import 'package:bloclabs/bloc_pattern_architecture/utils/flush_bar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login/login_bloc.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const LoginButton({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) => current.status != previous.status,
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          FlushBarHelper.flushBarErrorMessage(state.message, context);
        }
        if (state.status == LoginStatus.success) {
          FlushBarHelper.flushBarSuccessMessage(state.message, context);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: (previous, current) => current.status != previous.status,
        builder: (context, state) {
          return state.status == LoginStatus.loading
              ? CircularProgressIndicator()
              : ElevatedButton.icon(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<LoginBloc>().add(LoginAPICalled());
                    }
                  },
                  label: Text('Login'),
                  icon: Icon(Icons.login_rounded),
                );
        },
      ),
    );
  }
}
