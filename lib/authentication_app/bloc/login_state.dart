part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, failure }

class LoginState extends Equatable {
  final String email;
  final String password;
  final String message;
  final LoginStatus status;

  const LoginState({this.email = '', this.password = '', this.message = '', this.status = LoginStatus.initial});

  LoginState copyWith({String? email, String? password, String? message, LoginStatus? status}) => LoginState(
    email: email ?? this.email,
    password: password ?? this.password,
    message: message ?? this.message,
    status: status ?? this.status,
  );

  @override
  List<Object?> get props => [email, password, message, status];
}
