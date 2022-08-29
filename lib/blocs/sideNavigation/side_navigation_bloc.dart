import 'package:aptitudes/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'side_navigation_event.dart';
part 'side_navigation_state.dart';

class SideNavigationBloc
    extends Bloc<SideNavigationEvent, SideNavigationState> {
  SideNavigationBloc()
      : super(SideNavigationInitial(
            currentIndex: SideNavigationIndex.dashboard, isCollapsed: false)) {
    on<NavigateTo>((event, emit) => emit(SideNavigationInitial(
        currentIndex: event.newIndex,
        isCollapsed: (state as SideNavigationInitial).isCollapsed)));
    on<Collapse>((event, emit) => emit(SideNavigationInitial(
        currentIndex: (state as SideNavigationInitial).currentIndex,
        isCollapsed: !(state as SideNavigationInitial).isCollapsed)));
  }
  @override
  void onChange(Change<SideNavigationState> change) {
    print(change.nextState.toString());    
    super.onChange(change);
  }
}
