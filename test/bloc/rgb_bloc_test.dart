import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/data/clipboard.dart';
import 'package:rgb_mix/resources/enum.dart';

import '../helpers/mocks.dart';

void main() {
  late final CopyClipboard clipboard;
  late final MockSharedPreferences sharedPreferences;
  setUpAll(() {
    clipboard = MockCopyClipboard();
    sharedPreferences = MockSharedPreferences();
    when(() => clipboard.setData(any())).thenAnswer((_) async => true);
    when(() => sharedPreferences.getString(any())).thenAnswer((_) => '00');
    when(() => sharedPreferences.setString(any(), any()))
        .thenAnswer((_) async => true);
  });

  test('RgbBloc with initial state is RgbState.init()', () {
    expect(
        RgbBloc(clipboard: clipboard, sharedPreferences: sharedPreferences)
            .state,
        const RgbState('00', '00', '00', false));
  });

  blocTest(
    'RgbBloc emit a values changed state when add a event',
    build: () =>
        RgbBloc(clipboard: clipboard, sharedPreferences: sharedPreferences),
    act: (RgbBloc bloc) {
      bloc.add(InitRgbEvent());
      bloc.add(const ChangeRed('01'));
      bloc.add(const ChangeGreen('01'));
      bloc.add(const ChangeBlue('01'));
      bloc.add(IncreaseRgbEvent(LabelColor.red));
      bloc.add(DecreaseRgbEvent(LabelColor.red));
      bloc.add(SetDataClipboardEvent());
      bloc.add(MixAgainEvent());
    },
    expect: () => [
      const RgbState('00', '00', '00', false),
      const RgbState('01', '00', '00', false),
      const RgbState('01', '01', '00', false),
      const RgbState('01', '01', '01', false),
      const RgbState('02', '01', '01', false),
      const RgbState('01', '01', '01', false),
      const RgbState('01', '01', '01', true),
      const RgbState('01', '01', '01', false),
    ],
  );
}
