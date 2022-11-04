part of 'rgb_bloc.dart';

class RgbState extends Equatable {
  static const double strokeWidth = 40.0;
  final String red;
  final String green;
  final String blue;

  const RgbState(this.red, this.green, this.blue);

  const RgbState.init()
      : red = StringResources.textColorCodeZero,
        green = StringResources.textColorCodeZero,
        blue = StringResources.textColorCodeZero;

  RgbState copyWith({
    String? red,
    String? green,
    String? blue,
  }) =>
      RgbState((red ?? this.red).asFix2, (green ?? this.green).asFix2,
          (blue ?? this.blue).asFix2);

  String get color => '${StringResources.textColorCodeFF}$red$green$blue';

  String get colorCopy => '$red$green$blue';

  double get redValue => red.toDouble * strokeWidth / 255;

  double get greenValue => green.toDouble * strokeWidth / 255;

  double get blueValue => blue.toDouble * strokeWidth / 255;

  @override
  List<Object?> get props => [red, green, blue];
}
