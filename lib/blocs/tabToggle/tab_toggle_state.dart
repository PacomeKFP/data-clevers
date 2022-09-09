part of 'tab_toggle_bloc.dart';

@immutable
abstract class TabToggleState {}

class TabToggleInitialState extends TabToggleState {
  final TrainingTabIndex tabIndex;
  final ProfileTabIndex? profileTab;

  TabToggleInitialState({required this.tabIndex, this.profileTab});
}

