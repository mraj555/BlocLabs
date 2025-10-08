import 'dart:developer';
import 'package:bloclabs/bloc_pattern_architecture/repository/auth/login_repository.dart';
import 'package:bloclabs/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login/login_bloc.dart';
import 'widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _bloc;
  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _bloc = LoginBloc(repo: getIt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Login'), centerTitle: true),
        body: BlocProvider<LoginBloc>(
          create: (context) => _bloc,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EmailInputWidget(emailNode: emailNode),
                  SizedBox(height: 20),
                  PasswordInputWidget(passwordNode: passwordNode),
                  SizedBox(height: 50),
                  LoginButton(formKey: _formKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
