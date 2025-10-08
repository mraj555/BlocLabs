part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  final String email;

  const LoginEmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

class LoginEmailUnfocused extends LoginEvent {}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  const LoginPasswordChanged({required this.password});

  @override
  List<Object?> get props => [password];
}

class LoginPasswordUnfocused extends LoginEvent {}

class LoginAPICalled extends LoginEvent {}
