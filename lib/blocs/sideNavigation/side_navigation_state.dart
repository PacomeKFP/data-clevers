part of 'side_navigation_bloc.dart';

@immutable
abstract class SideNavigationState {}

class SideNavigationInitial extends SideNavigationState {
  final SideNavigationIndex currentIndex;
  final bool isCollapsed;
  // final List<String> routes;

  SideNavigationInitial(
      {required this.currentIndex, required this.isCollapsed});

  @override
  String toString() {
    // TODO: implement toString
    return 'currentIndex: --> ${currentIndex.label}\n isCollapsed ? -- > $isCollapsed';
  }
}
