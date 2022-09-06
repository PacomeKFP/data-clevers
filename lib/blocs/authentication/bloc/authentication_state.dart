part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {
  final AuthMode authMode;
  final AuthState authState;
  final UserModel? currentUser;

  AuthenticationInitial(
      {this.authMode = AuthMode.none,
      this.authState = AuthState.unknown, this.currentUser});
}
