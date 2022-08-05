part of 'toggle_bloc.dart';

abstract class ToggleState extends Equatable {
  const ToggleState();

  @override
  List<Object> get props => [];
}

class ToggleInitialState extends ToggleState {
  final bool isVisible;

  const ToggleInitialState({
    required this.isVisible,
  });

  @override
  List<Object> get props => [
    isVisible,
  ];
}
