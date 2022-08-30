import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aptitudes/services/services.dart' as _auth;
import 'package:aptitudes/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<InitAuthentication>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

//if there is an user in Prefs, we just take it as current user and forget change the auth state
      if (prefs.getString('currentUser') != null) {
        emit(AuthenticationInitial(
            authState: AuthState.authenticated,
            currentUser:
                User.fromJson(json.decode(prefs.getString('currentUser')!))));
      }
    });

    add(InitAuthentication());
    on<AuthenticateUser>((event, emit) {
      if (event.authMethod == AuthMethod.emailPassword) {
        event.credentials != null && event.authMode == AuthMode.login
            ? _auth.emailPassLogin(
                email: event.credentials!['email']!,
                password: event.credentials!['password']!)
            : _auth.emailPassSign(
                email: event.credentials!['email']!,
                password: event.credentials!['password']!);
      } else {
        event.authMethod.method.then((value) => log(value.user.toString()));
      }
      emit(AuthenticationInitial(
        authState: AuthState.authenticated,
      ));
    });

    on<LogoutUser>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear().then((value) => print(value
          ? 'User removed from prefs'
          : 'Error: User Not removed from prefs\n'));

      await _auth.signOut().then((value) => print('User loged Out'));
      emit(AuthenticationInitial(authState: AuthState.unAuthenticated));
    });
  }
}
