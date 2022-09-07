import 'package:aptitudes/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_globals_event.dart';
part 'app_globals_state.dart';

class AppGlobalsBloc extends Bloc<AppGlobalsEvent, AppGlobalsState> {
  AppGlobalsBloc()
      : super(AppGlobalsInitial(
            lang: AppLanguages.english,
            theme: SchedulerBinding.instance.window.platformBrightness)) {
    on<InitApp>((event, emit) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      ///Get the lang Stored in prefs
      String? langStr = prefs.getString('lang');

      ///Convert the String lang into a
      AppLanguages lang = AppLanguages.fromString(langStr);

      /// get The theme saved in sharedPrefs
      String? them = prefs.getString("theme");
      Brightness theme = them == 'light'
          ? Brightness.light
          : them == 'dark'
              ? Brightness.dark
              : SchedulerBinding.instance.window.platformBrightness;
      emit(AppGlobalsInitial(
          theme: (state as AppGlobalsInitial).theme, lang: lang));
    });

    ///We initialize the app Using the sharedpPrefs Content
    InitApp();

    ///For Switching Lang into app, we just have to emmit a new state with the new lang
    on<SwitchLanguage>((event, emit) => emit(AppGlobalsInitial(
        theme: (state as AppGlobalsInitial).theme, lang: event.newLang)));

    ///To change the AppTheme, we just have to emmit a new state with the new theme
    on<SwitchTheme>((event, emit) => emit(AppGlobalsInitial(
        lang: (state as AppGlobalsInitial).lang, theme: event.newTheme)));
  }
  @override
  Future<void> onChange(Change<AppGlobalsState> change) async {
    ///when a new state is emmited, we have to save it in SharedPrefs
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AppGlobalsInitial newState = change.nextState as AppGlobalsInitial;
    prefs.setString("lang", newState.lang.abbr);
    prefs.setString("theme", newState.theme.name);

    super.onChange(change);
  }
}
