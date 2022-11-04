import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/resources/strings.dart';
import 'package:rgb_mix/utils/ext.dart';

part 'rgb_event.dart';
part 'rgb_state.dart';

class RgbBloc extends Bloc<RgbEvent, RgbState> {
  RgbBloc() : super(const RgbState.init()) {
    on<ChangeRed>(onChangeRed);
    on<ChangeGreen>(onChangeGreen);
    on<ChangeBlue>(onChangeBlue);
  }

  void onChangeRed(ChangeRed event, Emitter emit) {
    emit(state.copyWith(red: event.value.toUpperCase()));
  }

  void onChangeGreen(ChangeGreen event, Emitter emit) {
    emit(state.copyWith(green: event.value.toUpperCase()));
  }

  void onChangeBlue(ChangeBlue event, Emitter emit) {
    emit(state.copyWith(blue: event.value.toUpperCase()));
  }
}
