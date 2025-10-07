import 'package:bloclabs/authentication_app/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _bloc;
  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  @override
  void initState() {
    _bloc = LoginBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<LoginBloc>(
        create: (context) => _bloc,
        child: Scaffold(
          appBar: AppBar(title: Text("Login"), centerTitle: true),
          body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) => current.email != previous.email,
                  builder: (context, state) {
                    return TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      focusNode: _emailNode,
                      decoration: InputDecoration(hintText: "Email", border: OutlineInputBorder()),
                      onChanged: (value) => context.read<LoginBloc>().add(EmailChanged(email: value)),
                      onFieldSubmitted: (value) {},
                    );
                  },
                ),
                SizedBox(height: 20),
                BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) => current.password != previous.password,
                  builder: (context, state) {
                    return TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      focusNode: _passwordNode,
                      decoration: InputDecoration(hintText: "Password", border: OutlineInputBorder()),
                      onChanged: (value) => context.read<LoginBloc>().add(PasswordChanged(password: value)),
                      onFieldSubmitted: (value) {},
                    );
                  },
                ),
                SizedBox(height: 50),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    if (state.status == LoginStatus.failure) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text(state.message)));
                    }
                    if (state.status == LoginStatus.loading) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text("Login is processing...")));
                    }
                    if (state.status == LoginStatus.success) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (previous, current) => false,
                    builder: (context, state) {
                      return ElevatedButton.icon(
                        onPressed: () => context.read<LoginBloc>().add(LoginAPI()),
                        label: Text("Login"),
                        icon: Icon(Icons.login_rounded),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
