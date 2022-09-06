part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}
class InitAuthentication extends AuthenticationEvent {}
class AuthenticateUser extends AuthenticationEvent{
  final AuthMode authMode;
  final AuthMethod authMethod;
  final Map<String, String>? credentials;

  AuthenticateUser({required this.authMode, required this.authMethod, this.credentials});
  
}
class LogoutUser extends AuthenticationEvent{}
