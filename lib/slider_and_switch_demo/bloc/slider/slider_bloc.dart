import 'package:bloc/bloc.dart';
import 'package:bloclabs/slider_and_switch_demo/bloc/slider/slider_event.dart';
import 'package:bloclabs/slider_and_switch_demo/bloc/slider/slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderState()) {
    on<ChangeOpacity>(_onChangeOpacity);
  }

  void _onChangeOpacity(ChangeOpacity event, Emitter<SliderState> emit) {
    emit(state.copyWith(opacity: event.opacity));
  }
}
