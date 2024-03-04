import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/data/clipboard.dart';
import 'package:rgb_mix/data/repository.dart';
import 'package:rgb_mix/resources/enum.dart';

import '../helpers/helpers.dart';

void main() {
  late final CopyClipboard clipboard;
  late final MockSharedPreferences sharedPreferences;
  late final RgbBloc bloc;
  setUpAll(() {
    clipboard = MockCopyClipboard();
    sharedPreferences = MockSharedPreferences();
    bloc = RgbBloc(Repository(sharedPreferences, clipboard));
    when(() => clipboard.setData(any())).thenAnswer((_) async => true);
    when(() => sharedPreferences.getString(any())).thenAnswer((_) => '00');
    when(() => sharedPreferences.setString(any(), any()))
        .thenAnswer((_) async => true);
  });

  group('RgbBloc', () {
    test('RgbBloc with initial state is RgbState.init()', () {
      expect(bloc.state,
          const RgbState(red: '00', green: '00', blue: '00', isCopied: false));
    });

    blocTest(
      'RgbBloc emit a values changed state when add a event',
      build: () => bloc,
      act: (RgbBloc bloc) {
        bloc.add(const RgbEvent.init());
        bloc.add(const RgbEvent.changeRed('01'));
        bloc.add(const RgbEvent.changeGreen('01'));
        bloc.add(const RgbEvent.changeBlue('01'));
        bloc.add(const RgbEvent.touch(ColorLabel.redSecond, increase: true));
        bloc.add(const RgbEvent.touch(ColorLabel.redSecond, increase: false));
        bloc.add(const RgbEvent.touch(ColorLabel.greenSecond, increase: true));
        bloc.add(const RgbEvent.touch(ColorLabel.greenSecond, increase: false));
        bloc.add(const RgbEvent.touch(ColorLabel.blueSecond, increase: true));
        bloc.add(const RgbEvent.touch(ColorLabel.blueSecond, increase: false));
        bloc.add(const RgbEvent.setClipboard());
        bloc.add(const RgbEvent.mixAgain());
      },
      expect: () => [
        const RgbState(red: '00', green: '00', blue: '00', isCopied: false),
        const RgbState(red: '01', green: '00', blue: '00', isCopied: false),
        const RgbState(red: '01', green: '01', blue: '00', isCopied: false),
        const RgbState(red: '01', green: '01', blue: '01', isCopied: false),
        const RgbState(red: '02', green: '01', blue: '01', isCopied: false),
        const RgbState(red: '01', green: '01', blue: '01', isCopied: false),
        const RgbState(red: '01', green: '02', blue: '01', isCopied: false),
        const RgbState(red: '01', green: '01', blue: '01', isCopied: false),
        const RgbState(red: '01', green: '01', blue: '02', isCopied: false),
        const RgbState(red: '01', green: '01', blue: '01', isCopied: false),
        const RgbState(red: '01', green: '01', blue: '01', isCopied: true),
        const RgbState(red: '01', green: '01', blue: '01', isCopied: false),
      ],
    );
  });
}
