part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class Loginnitial extends LoginState {
  final String error,
  final String code,
  LoginErrorState({
    required this.error,
    required this.code
  })
}
