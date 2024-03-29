import 'package:aptitudes/models/models.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_toggle_event.dart';
part 'tab_toggle_state.dart';

class TabToggleBloc extends Bloc<TabToggleEvent, TabToggleState> {
  TabToggleBloc()
      : super(TabToggleInitialState(
            tabIndex: TrainingTabIndex.current,
            profileTab: ProfileTabIndex.about)) {
    on<ChangeTab>(
        (event, emit) => emit(TabToggleInitialState(tabIndex: event.index)));
    on<ChangeProfileTab>((event, emit) => emit(TabToggleInitialState(
        profileTab: event.index,
        tabIndex: (state as TabToggleInitialState).tabIndex)));
  }
  @override
  void onChange(Change<TabToggleState> change) {
    // print(change);
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    print(
        "error occured in TabToggle $error \n\n the traceTack is $stackTrace");
    super.onError(error, stackTrace);
  }
}
