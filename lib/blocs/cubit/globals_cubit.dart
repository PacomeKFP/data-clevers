import 'package:bloc/bloc.dart';
import 'package:data_clevers/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'globals_state.dart';

class GlobalsCubit extends Cubit<GlobalsState> {
  GlobalsCubit() : super(GlobalsState());

  void init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state.lang = getAppLang(prefs.getString('lang'));
    state.theme = getAppThe(prefs.getString('theme'));
  }

  void changeTheme(Brightness brightness) {
    var newState = GlobalsState(lang: state.lang, theme: brightness);
    emit(newState);
  }

  void changeLanguage(String lang) {
    var newState = GlobalsState(lang: getAppLang(lang), theme: state.theme);
    emit(newState);
  }

  AppLanguages getAppLang(String? lang) {
    switch (lang) {
      case 'fr':
        return AppLanguages.FRENCH;
      case 'en':
        return AppLanguages.ENGLISH;
      default:
        return AppLanguages.FRENCH;
    }
  }

  Brightness getAppThe(String? theme) {
    switch (theme) {
      case 'light':
        return Brightness.light;
      default:
        return Brightness.dark;
    }
  }
}
