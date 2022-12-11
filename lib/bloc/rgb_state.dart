part of 'rgb_bloc.dart';

class RgbState extends Equatable {
  static const double strokeWidth = 40.0;
  final String red;
  final String green;
  final String blue;
  final bool isCopied;

  const RgbState(this.red, this.green, this.blue, this.isCopied);

  const RgbState.init()
      : red = StringResources.textColorCodeZero,
        green = StringResources.textColorCodeZero,
        blue = StringResources.textColorCodeZero,
        isCopied = false;

  RgbState copyWith({
    String? red,
    String? green,
    String? blue,
    bool? isCopied,
  }) =>
      RgbState((red ?? this.red).asFix2, (green ?? this.green).asFix2,
          (blue ?? this.blue).asFix2, isCopied ?? this.isCopied);

  String get color => '${StringResources.textColorCodeFF}$red$green$blue';

  String get colorCopy => '$red$green$blue';

  double get redValue => red.toDouble;

  double get greenValue => green.toDouble;

  double get blueValue => blue.toDouble;

  double get redStrokeValue => red.toDouble * strokeWidth / 255;

  double get greenStrokeValue => green.toDouble * strokeWidth / 255;

  double get blueStrokeValue => blue.toDouble * strokeWidth / 255;

  @override
  List<Object?> get props => [red, green, blue, isCopied];
}
