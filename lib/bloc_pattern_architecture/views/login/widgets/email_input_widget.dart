import 'package:bloclabs/bloc_pattern_architecture/utils/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/login/login_bloc.dart';

class EmailInputWidget extends StatelessWidget {
  final FocusNode emailNode;

  const EmailInputWidget({super.key, required this.emailNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => current.email != previous.email,
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.emailAddress,
          focusNode: emailNode,
          decoration: InputDecoration(hintText: 'Email', border: OutlineInputBorder()),
          onChanged: (value) => context.read<LoginBloc>().add(LoginEmailChanged(email: value)),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter email';
            }
            if (!Validations.emailValidator(value)) {
              return 'Enter valid email';
            }
            return null;
          },
          onFieldSubmitted: (value) {},
        );
      },
    );
  }
}
