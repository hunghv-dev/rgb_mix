part of 'rgb_bloc.dart';

@freezed
class RgbState with _$RgbState {
  const RgbState._();

  const factory RgbState({
    @Default(StringResources.textColorCodeZero) String red,
    @Default(StringResources.textColorCodeZero) String green,
    @Default(StringResources.textColorCodeZero) String blue,
    @Default(false) bool isCopied,
  }) = _RgbState;

  static const double strokeWidth = 40.0;

  String get color => '${StringResources.textColorCodeFF}$red$green$blue';

  String get colorCopy => '$red$green$blue';

  double get redValue => red.toDouble;

  double get greenValue => green.toDouble;

  double get blueValue => blue.toDouble;

  double get redStrokeValue => redValue * strokeWidth / 255;

  double get greenStrokeValue => greenValue * strokeWidth / 255;

  double get blueStrokeValue => blueValue * strokeWidth / 255;
}
