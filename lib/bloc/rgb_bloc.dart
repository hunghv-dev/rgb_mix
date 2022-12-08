import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/resources/enum.dart';
import 'package:rgb_mix/resources/strings.dart';
import 'package:rgb_mix/utils/ext.dart';

part 'rgb_event.dart';

part 'rgb_state.dart';

class RgbBloc extends Bloc<RgbEvent, RgbState> {
  RgbBloc() : super(const RgbState.init()) {
    on<ChangeRed>(onChangeRed);
    on<ChangeGreen>(onChangeGreen);
    on<ChangeBlue>(onChangeBlue);
    on<IncreaseRgbEvent>(onIncreaseRgbEvent);
    on<DecreaseRgbEvent>(onDecreaseRgbEvent);
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

  String? _increase(double value) =>
      value < 255 ? (value + 1).hex.toUpperCase() : null;

  void onIncreaseRgbEvent(IncreaseRgbEvent event, Emitter emit) {
    if (event.color == LabelColor.red) {
      return emit(state.copyWith(red: _increase(state.redValue)));
    }
    if (event.color == LabelColor.green) {
      return emit(state.copyWith(green: _increase(state.greenValue)));
    }
    return emit(state.copyWith(blue: _increase(state.blueValue)));
  }

  String? _decrease(double value) =>
      value > 0 ? (value - 1).hex.toUpperCase() : null;

  void onDecreaseRgbEvent(DecreaseRgbEvent event, Emitter emit) {
    if (event.color == LabelColor.red) {
      return emit(state.copyWith(red: _decrease(state.redValue)));
    }
    if (event.color == LabelColor.green) {
      return emit(state.copyWith(green: _decrease(state.greenValue)));
    }
    return emit(state.copyWith(blue: _decrease(state.blueValue)));
  }
}
