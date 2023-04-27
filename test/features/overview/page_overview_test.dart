import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/features/overview/page_overview.dart';

import '../../helpers/helpers.dart';

void main() {
  late MockNavigator navigator;
  late RgbBloc bloc;

  setUp(() async {
    navigator = MockNavigator();
    when(() => navigator.pop()).thenAnswer((_) async {});
    bloc = MockRgbBloc();
    when(() => bloc.state).thenReturn(const RgbState.init());
  });

  group('Page Overview', () {
    testWidgets('start => visible: PageOverview', (tester) async {
      await tester.pumpApp(bloc: bloc, child: const PageOverview());
      expect(find.byType(PageOverview), findsOneWidget);
    });

    testWidgets(
      'tap GestureDetector => pop',
      (tester) async {
        await tester.pumpApp(
          bloc: bloc,
          child: const PageOverview(),
          navigator: navigator,
        );
        final finderButton = find.byType(GestureDetector);
        await tester.ensureVisible(finderButton);
        await tester.tap(finderButton);
        await tester.pump(kDoubleTapMinTime);
        await tester.tap(finderButton);
        await tester.pumpAndSettle();
        verify(() => navigator.pop()).called(1);
      },
    );
  });
}
