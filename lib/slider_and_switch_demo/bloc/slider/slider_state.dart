// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class SliderState extends Equatable {
  double opacity;

  SliderState({this.opacity = .4});

  SliderState copyWith({double? opacity}) => SliderState(opacity: opacity ?? this.opacity);

  @override
  List<Object?> get props => [opacity];
}
