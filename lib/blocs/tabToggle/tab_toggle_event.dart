part of 'tab_toggle_bloc.dart';

@immutable
abstract class TabToggleEvent {}

class ChangeTab extends TabToggleEvent {
  final TrainingTabIndex index;
  ChangeTab(this.index);
}
class HoverTab extends TabToggleEvent {
  final TrainingTabIndex index;
  HoverTab(this.index);
}
