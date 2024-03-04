import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rgb_mix/resources/strings.dart';
import 'package:rgb_mix/utils/ext.dart';

import '../data/repository.dart';
import '../resources/enum.dart';

part 'rgb_bloc.freezed.dart';
part 'rgb_event.dart';
part 'rgb_state.dart';

@injectable
class RgbBloc extends Bloc<RgbEvent, RgbState> {
  RgbBloc(this._repository) : super(const RgbState()) {
    on<_Init>(_onInit);
    on<_ChangeRed>(_onChangeRed);
    on<_ChangeGreen>(_onChangeGreen);
    on<_ChangeBlue>(_onChangeBlue);
    on<_Touch>(_onTouch);
    on<_SetClipboard>(_onSetClipboard);
    on<_MixAgain>(_onMixAgain);
  }

  final Repository _repository;

  void _onInit(_, emit) => emit(state.copyWith(
        red: _repository.getRed(),
        green: _repository.getGreen(),
        blue: _repository.getBlue(),
      ));

  void _onChangeRed(_ChangeRed event, emit) =>
      emit(state.copyWith(red: event.value.toUpperCase().asFix2));

  void _onChangeGreen(_ChangeGreen event, emit) =>
      emit(state.copyWith(green: event.value.toUpperCase().asFix2));

  void _onChangeBlue(_ChangeBlue event, emit) =>
      emit(state.copyWith(blue: event.value.toUpperCase().asFix2));

  String _increase(double value) => value < 255
      ? (value + 1).hex.toUpperCase().asFix2
      : StringResources.textColorCodeZero;

  String _decrease(double value) => value > 0
      ? (value - 1).hex.toUpperCase().asFix2
      : StringResources.textColorCodeFF;

  _onTouch(_Touch event, emit) {
    if (event.color.isRed) {
      emit(state.copyWith(
          red: event.increase
              ? _increase(state.redValue)
              : _decrease(state.redValue)));
    } else if (event.color.isGreen) {
      emit(state.copyWith(
          green: event.increase
              ? _increase(state.greenValue)
              : _decrease(state.greenValue)));
    } else if (event.color.isBlue) {
      emit(state.copyWith(
          blue: event.increase
              ? _increase(state.blueValue)
              : _decrease(state.blueValue)));
    }
  }

  void _onSetClipboard(_, emit) async => await Future.wait([
        _repository.saveClipboard(state.colorCopy),
        _repository.setRed(state.red),
        _repository.setGreen(state.green),
        _repository.setBlue(state.blue),
      ]).then((_) => emit(state.copyWith(isCopied: true)));

  void _onMixAgain(_, emit) => emit(state.copyWith(isCopied: false));
}
