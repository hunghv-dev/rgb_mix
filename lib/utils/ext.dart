import 'dart:math';
import 'package:flutter/material.dart';
import '../resources/enum.dart';

extension NumExt on num {
  double get toRad => this * pi / 180.0;

  String get hex => toInt().toRadixString(16);
}

extension StringExt on String {
  String get asFix2 => '${length == 1 ? '0' : ''}$this';

  Color get toColor => Color(int.parse(toUpperCase(), radix: 16));

  double get toDouble => (int.tryParse(this, radix: 16) ?? 0.0).toDouble();
}

extension LabelColorIndexExt on LabelColorIndex {
  Color get toColor {
    switch (index) {
      case 0:
      case 1:
        return Colors.red;
      case 2:
      case 3:
        return Colors.green;
      case 4:
      case 5:
      default:
        return Colors.blue;
    }
  }
}

extension ColorExt on Color {
  Color get invert => Color.fromARGB(
        (opacity * 255).round(),
        255 - red,
        255 - green,
        255 - blue,
      );
}
