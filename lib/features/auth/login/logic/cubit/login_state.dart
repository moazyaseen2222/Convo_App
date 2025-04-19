part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

final class LoginError extends LoginState {
  final String message;

  LoginError(this.message);
}
