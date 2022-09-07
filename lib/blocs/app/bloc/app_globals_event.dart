part of 'app_globals_bloc.dart';

@immutable
abstract class AppGlobalsEvent {}

class InitApp extends AppGlobalsEvent{}
class SwitchLanguage extends AppGlobalsEvent{
  final AppLanguages newLang;

  SwitchLanguage(this.newLang);
}
class SwitchTheme extends AppGlobalsEvent{
  final Brightness newTheme;

  SwitchTheme(this.newTheme);
}
