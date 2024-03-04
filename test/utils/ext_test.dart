import 'package:base_define/base_define.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rgb_mix/utils/ext.dart';

void main() {
  group('EXT', () {
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
        expect('000000'.color, const Color(0x00000000));
      });

      test('getter toDouble', () => expect('FF'.toDouble, 255.0));
    });

    group('Color type', () {
      test('getter invert', () => expect(Colors.black.invert, Colors.white));
    });
  });
}
