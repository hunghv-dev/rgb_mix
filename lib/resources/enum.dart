import 'package:flutter/material.dart';

enum ColorLabel {
  redFirst,
  redSecond,
  greenFirst,
  greenSecond,
  blueFirst,
  blueSecond;

  Color get color {
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

  bool get isRed => index == 0 || index == 1;

  bool get isGreen => index == 2 || index == 3;

  bool get isBlue => index == 4 || index == 5;
}
