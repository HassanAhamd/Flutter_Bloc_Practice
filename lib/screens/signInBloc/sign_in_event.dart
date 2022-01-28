part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class SignInTextChangeEvent extends SignInEvent{
  final String email;
  final String password;

  SignInTextChangeEvent({required this.email, required this.password});
}

class SignInSubmittedEvent extends SignInEvent{
  final String email;
  final String password;

  SignInSubmittedEvent({required this.email, required this.password});
}
