import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sidemenu_state.dart';

class SidemenuCubit extends Cubit<SidemenuState> {
  SidemenuCubit() : super(SidemenuInitial());
}
