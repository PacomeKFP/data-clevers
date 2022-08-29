import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
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
    on<AuthenticationEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LogoutUser>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear().then((value) =>
          print(value ? 'User logged out' : 'User Not loged out, error'));

      //TODO implement firebase logout!
      //FirebaseAuth.instance.lougout()
      emit(AuthenticationInitial(authState: AuthState.unAuthenticated));
    });
  }
}
