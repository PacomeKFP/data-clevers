import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'toggle_event.dart';
part 'toggle_state.dart';

class ToggleBloc extends Bloc<ToggleEvent, ToggleState> {
  ToggleBloc() : super(const ToggleInitialState(isVisible : true)) {
    
    
    on<TogleHideEvent>((event, emit) {
       emit( ToggleInitialState(isVisible: !(state as ToggleInitialState).isVisible));
    });
  }
}
