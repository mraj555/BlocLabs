// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  bool isNotification;

  SwitchState({this.isNotification = true});

  SwitchState copyWith({bool? isNotification}) => SwitchState(isNotification: isNotification ?? this.isNotification);

  @override
  List<Object?> get props => [isNotification];
}
