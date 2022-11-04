import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';

void main() {
  test('RgbBloc with initial state is RgbState.init()', () {
    expect(RgbBloc().state, const RgbState('00', '00', '00'));
  });

  blocTest(
    'RgbBloc emit a values changed state when add a event',
    build: () => RgbBloc(),
    act: (RgbBloc bloc) {
      bloc.add(const ChangeRed('FF'));
      bloc.add(const ChangeGreen('FF'));
      bloc.add(const ChangeBlue('FF'));
    },
    expect: () => [
      const RgbState('FF', '00', '00'),
      const RgbState('FF', 'FF', '00'),
      const RgbState('FF', 'FF', 'FF'),
    ],
  );
}
