import 'package:flutter_test/flutter_test.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';

void main() {
  test('RgbEvent support for compare object', () {
    expect(const RgbEvent.init(), const RgbEvent.init());
    expect(const RgbEvent.changeRed('00'), const RgbEvent.changeRed('00'));
    expect(const RgbEvent.changeRed('00') != const RgbEvent.changeRed('FF'),
        isTrue);
    expect(const RgbEvent.changeRed('00') != const RgbEvent.changeGreen('00'),
        isTrue);
  });
}
