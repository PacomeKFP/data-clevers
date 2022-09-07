part of 'app_globals_bloc.dart';

@immutable
abstract class AppGlobalsState {}

class AppGlobalsInitial extends AppGlobalsState {
  final Brightness theme;
  final AppLanguages lang;

  AppGlobalsInitial({required this.theme, required this.lang});
}
