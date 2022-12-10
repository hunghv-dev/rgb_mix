import 'package:flutter_test/flutter_test.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';

void main() {
  test('RgbEvent support for compare object', () {
    expect(ChangeRgbEvent('test'), ChangeRgbEvent('test'));
  });
}
