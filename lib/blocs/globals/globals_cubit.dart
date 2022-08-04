import 'package:bloc/bloc.dart';
import 'package:data_clevers/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'globals_state.dart';
part 'globals_observer.dart';
//theme et langue
class GlobalsCubit extends Cubit<GlobalsState> {
  GlobalsCubit() : super(GlobalsState());
  
  void init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state.lang = prefs.getString('lang')!;
    state.theme =getAppThe(prefs.getString('theme'));
  }

  void save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', state.lang);
    prefs.setString('lang', unStrTheme(state.theme));
  }

  void changeTheme(Brightness brightness) {
    var newState = GlobalsState(lang: state.lang, theme: brightness);
    emit(newState);
    save();
  }

  void changeLanguage(String lang) {
    var newState = GlobalsState(lang: lang, theme: state.theme);
    emit(newState);
    save();
  }

  

  

  Brightness getAppThe(String? theme) {
    switch (theme) {
      case 'light':
        return Brightness.light;
      default:
        return Brightness.dark;
    }
  }
  String unStrTheme(Brightness theme) {
    switch (theme) {
      case Brightness.light:
        return 'light';
      default:
        return 'dark';
    }
  }
}