import 'package:bloc/bloc.dart';
import 'package:bloclabs/slider_and_switch_demo/bloc/switch/switch_event.dart';
import 'package:bloclabs/slider_and_switch_demo/bloc/switch/switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDisableNotification>(_onEnableOrDisableNotification);
  }

  void _onEnableOrDisableNotification(EnableOrDisableNotification event, Emitter<SwitchState> emit) {
    emit(state.copyWith(isNotification: !state.isNotification));
  }
}
