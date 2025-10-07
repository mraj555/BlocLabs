import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<LoginAPI>(_onLoginAPI);
  }

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email, status: LoginStatus.initial));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password, status: LoginStatus.initial));
  }

  void _onLoginAPI(LoginAPI event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStatus.loading));
    Map<String, dynamic> credential = {'email': state.email, 'password': state.password};

    try {
      final response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        body: credential,
        headers: {'x-api-key': 'reqres-free-v1'},
      );
      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        emit(state.copyWith(message: "Login Successfully : ${data['token']}.", status: LoginStatus.success));
      } else {
        emit(state.copyWith(message: data['error'], status: LoginStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(message: e.toString(), status: LoginStatus.failure));
    }
  }
}
