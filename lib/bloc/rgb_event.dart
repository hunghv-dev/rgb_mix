part of 'rgb_bloc.dart';

@freezed
class RgbEvent with _$RgbEvent {
  const factory RgbEvent.init() = _Init;

  const factory RgbEvent.changeRed(String value) = _ChangeRed;

  const factory RgbEvent.changeGreen(String value) = _ChangeGreen;

  const factory RgbEvent.changeBlue(String value) = _ChangeBlue;

  const factory RgbEvent.touch(ColorLabel color, {required bool increase}) =
      _Touch;

  const factory RgbEvent.setClipboard() = _SetClipboard;

  const factory RgbEvent.mixAgain() = _MixAgain;
}
