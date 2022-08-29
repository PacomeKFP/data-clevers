part of 'tab_toggle_bloc.dart';

@immutable
abstract class TabToggleState {}

class TabToggleInitialState extends TabToggleState {
  final TrainingTabIndex tabIndex;

  TabToggleInitialState({required this.tabIndex});
}
