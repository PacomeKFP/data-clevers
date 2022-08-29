part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {
  final AuthMode authMode;
  final AuthState authState;

  AuthenticationInitial(
      {this.authMode = AuthMode.login,
      this.authState = AuthState.unAuthenticated});
}
