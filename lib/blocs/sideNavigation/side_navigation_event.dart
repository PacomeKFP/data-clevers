part of 'side_navigation_bloc.dart';

@immutable
abstract class SideNavigationEvent {}

class NavigateTo extends SideNavigationEvent {
  final SideNavigationIndex newIndex;
  NavigateTo(this.newIndex);
}

class Collapse extends SideNavigationEvent {}
