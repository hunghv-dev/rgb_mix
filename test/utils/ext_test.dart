import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rgb_mix/resources/enum.dart';
import 'package:rgb_mix/utils/ext.dart';

void main() {
  group('num type', () {
    test('getter toRAd', () => expect(60.toRad, 1.0471975511965976));

    test('getter hex', () {
      expect(0.hex, '0');
      expect(16.hex, '10');
      expect(255.hex, 'ff');
    });
  });

  group('String type', () {
    test('getter asFix2', () {
      expect('A'.asFix2, '0A');
      expect('AA'.asFix2, 'AA');
    });

    test('getter toColor', () {
      expect('000000'.toColor, const Color(0x00000000));
    });

    test('getter toDouble', () => expect('FF'.toDouble, 255.0));
  });

  group('LabelColorIndex type', () {
    test('getter toColor', () {
      expect(LabelColorIndex.redFirst.toColor, Colors.red);
      expect(LabelColorIndex.greenFirst.toColor, Colors.green);
      expect(LabelColorIndex.blueFirst.toColor, Colors.blue);
    });
  });

  group('Color type', () {
    test('getter invert', () => expect(Colors.black.invert, Colors.white));
  });
}
