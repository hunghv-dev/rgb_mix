import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/data/clipboard.dart';
import 'package:rgb_mix/resources/enum.dart';
import 'package:rgb_mix/resources/strings.dart';
import 'package:rgb_mix/utils/ext.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'rgb_event.dart';

part 'rgb_state.dart';

class RgbBloc extends Bloc<RgbEvent, RgbState> {
  final CopyClipboard clipboard;
  final SharedPreferences sharedPreferences;

  RgbBloc({required this.clipboard, required this.sharedPreferences})
      : super(const RgbState.init()) {
    on<InitRgbEvent>(onInitRgbEvent);
    on<ChangeRed>(onChangeRed);
    on<ChangeGreen>(onChangeGreen);
    on<ChangeBlue>(onChangeBlue);
    on<IncreaseRgbEvent>(onIncreaseRgbEvent);
    on<DecreaseRgbEvent>(onDecreaseRgbEvent);
    on<SetDataClipboardEvent>(onSetDataClipboardEvent);
    on<MixAgainEvent>(onMixAgainEvent);
  }

  void onInitRgbEvent(InitRgbEvent event, Emitter emit) {
    final red =
        sharedPreferences.getString(StringResources.prefsTagRedColorCode);
    final green =
        sharedPreferences.getString(StringResources.prefsTagGreenColorCode);
    final blue =
        sharedPreferences.getString(StringResources.prefsTagBlueColorCode);
    emit(state.copyWith(red: red, green: green, blue: blue));
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
    if (event.color.isRed) {
      return emit(state.copyWith(red: _increase(state.redValue)));
    }
    if (event.color.isGreen) {
      return emit(state.copyWith(green: _increase(state.greenValue)));
    }
    if (event.color.isBlue) {
      return emit(state.copyWith(blue: _increase(state.blueValue)));
    }
  }

  String? _decrease(double value) =>
      value > 0 ? (value - 1).hex.toUpperCase() : null;

  void onDecreaseRgbEvent(DecreaseRgbEvent event, Emitter emit) {
    if (event.color.isRed) {
      return emit(state.copyWith(red: _decrease(state.redValue)));
    }
    if (event.color.isGreen) {
      return emit(state.copyWith(green: _decrease(state.greenValue)));
    }
    if (event.color.isBlue) {
      return emit(state.copyWith(blue: _decrease(state.blueValue)));
    }
  }

  void onSetDataClipboardEvent(
      SetDataClipboardEvent event, Emitter emit) async {
    await Future.wait([
      clipboard.setData(state.colorCopy),
      sharedPreferences.setString(
          StringResources.prefsTagRedColorCode, state.red),
      sharedPreferences.setString(
          StringResources.prefsTagGreenColorCode, state.green),
      sharedPreferences.setString(
          StringResources.prefsTagBlueColorCode, state.blue),
    ]).then((_) => emit(state.copyWith(isCopied: true)));
  }

  void onMixAgainEvent(MixAgainEvent event, Emitter emit) {
    emit(state.copyWith(isCopied: false));
  }
}
