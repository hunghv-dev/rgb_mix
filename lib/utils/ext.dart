import 'dart:math';

extension NumExt on num {
  double get toRad => this * pi / 180.0;

  String get hex => toInt().toRadixString(16);
}

extension StringExt on String {
  String get asFix2 => length > 1 ? this : '0$this';

  double get toDouble => (int.tryParse(this, radix: 16) ?? 0.0).toDouble();
}