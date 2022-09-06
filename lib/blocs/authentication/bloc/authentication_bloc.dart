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
      fireAuth.User? fireUser = fireAuth.FirebaseAuth.instance.currentUser;
      if (fireUser == null) {
        LogoutUser();
      } else {
        String? prefsUser = prefs.getString('currentUser');
        if (prefsUser != null &&
            json.decode(prefsUser)['uid'] != fireUser.uid) {
          fireAuth.FirebaseAuth.instance.signOut();
//TODO : Implement this part of the Auth Initialization
        }
      }

//if there is an user in Prefs, we just take it as current user and forget change the auth state
      if (prefs.getString('currentUser') != null) {
        emit(AuthenticationInitial(
            authState: AuthState.authenticated,
            currentUser: UserModel.fromJson(
                json.decode(prefs.getString('currentUser')!))));
      }
    });

    add(InitAuthentication());
    on<AuthenticateUser>((event, emit) async {
      if (event.authMethod == AuthMethod.userNamePassword &&
          event.authMode == AuthMode.login) {
        throw (Exception(
            "in AuthBloc ==> If Auth method is ${AuthMethod.userNamePassword} then AuthMode can't be ${event.authMode }, try correcting It "));
      }
      if ([AuthMethod.emailPassword, AuthMethod.userNamePassword]
              .contains(event.authMethod) &&
          event.credentials == null) {
        throw (Exception(
            "In AuthBloc ==> The user credentials can't be empties because the choosen Auth Method is ${event.authMethod}"));
      }
      Future<fireAuth.UserCredential?> userCredential;

      if (event.authMethod == AuthMethod.userNamePassword) {
        /// In this case the auth mode must be [AuthMode.login]
        userCredential = _auth.userNamePassLogin(
            userName: event.credentials!['userName']!,
            password: event.credentials!['password']!);
      }

// fireAuth.UserF
      if (event.authMethod == AuthMethod.emailPassword) {
        userCredential =
            event.credentials != null && event.authMode == AuthMode.login
                ? _auth.emailPassLogin(
                    email: event.credentials!['email']!,
                    password: event.credentials!['password']!)
                : _auth.emailPassSign(
                    email: event.credentials!['email']!,
                    password: event.credentials!['password']!);
      } else {
        userCredential = event.authMethod.signInWithAuthProvider
            .then((credentials) => credentials);
      }

      await userCredential.then(
        (creds) => print(creds!.user!.providerData.toString()),
      );

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
      emit(AuthenticationInitial(authState: AuthState.authenticated));
    });
  }
}
