import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SwitchState extends Equatable {
  bool isNotification;

  SwitchState({this.isNotification = true});

  SwitchState copyWith({bool? isNotification}) => SwitchState(isNotification: isNotification ?? this.isNotification);

  @override
  List<Object?> get props => [isNotification];
}
