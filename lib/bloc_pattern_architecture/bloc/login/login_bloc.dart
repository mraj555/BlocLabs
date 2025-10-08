import 'package:bloc/bloc.dart';
import 'package:bloclabs/bloc_pattern_architecture/repository/auth/login_repository.dart';
import 'package:equatable/equatable.dart';

import '../../utils/enums.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository repo = LoginRepository();

  LoginBloc() : super(LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    // on<LoginEmailUnfocused>();
    on<LoginPasswordChanged>(_onPasswordChanged);
    // on<LoginPasswordUnfocused>();
    on<LoginAPICalled>(_onLoginAPICalled);
  }

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email, status: LoginStatus.initial));
  }

  void _onPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password, status: LoginStatus.initial));
  }

  void _onLoginAPICalled(LoginAPICalled event, Emitter<LoginState> emit) async {
    Map<String, dynamic> credential = {'email': state.email.trim(), 'password': state.password.trim()};
    emit(state.copyWith(status: LoginStatus.loading));
    await repo
        .onLoginAPI(credential)
        .then((value) {
          if (value.error.isNotEmpty) {
            emit(state.copyWith(message: value.error, status: LoginStatus.error));
          } else {
            emit(state.copyWith(message: "Login Successful : ${value.token}", status: LoginStatus.success));
          }
        })
        .onError((error, stackTrace) {
          emit(state.copyWith(message: error.toString(), status: LoginStatus.error));
        });
  }
}
