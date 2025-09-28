import 'package:equatable/equatable.dart';

abstract class SliderEvent extends Equatable {
  const SliderEvent();

  @override
  List<Object?> get props => [];
}

class ChangeOpacity extends SliderEvent {
  double opacity;

  ChangeOpacity({required this.opacity});

  @override
  List<Object?> get props => [opacity];
}
