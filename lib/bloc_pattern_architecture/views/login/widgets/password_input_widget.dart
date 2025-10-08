import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login/login_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordNode;

  const PasswordInputWidget({super.key, required this.passwordNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => current.password != previous.password,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.visiblePassword,
          focusNode: passwordNode,
          obscureText: true,
          decoration: InputDecoration(hintText: 'Password', border: OutlineInputBorder()),
          onChanged: (value) => context.read<LoginBloc>().add(LoginPasswordChanged(password: value)),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter password';
            }
            if (state.password.length < 8) {
              return 'Please enter password greater than 8 characters.';
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
