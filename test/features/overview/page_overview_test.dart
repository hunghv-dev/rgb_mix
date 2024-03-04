import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/features/overview/overview_page.dart';

import '../../helpers/helpers.dart';

void main() {
  late RgbBloc bloc;
  late MockStackRouter mockStackRouter;

  setUpAll(() {
    registerFallbackValue(FakePageRouteInfo());
  });

  setUp(() async {
    bloc = MockRgbBloc();
    mockStackRouter = MockStackRouter();
    when(() => bloc.state).thenReturn(const RgbState());
  });

  group('Page Overview', () {
    testWidgets('start => visible: PageOverview', (tester) async {
      await tester.pumpApp(bloc: bloc, child: const OverviewPage());
      expect(find.byType(OverviewPage), findsOneWidget);
    });

    testWidgets(
      'tap GestureDetector => pop',
      (tester) async {
        await tester.pumpApp(
          bloc: bloc,
          child: const OverviewPage(),
          mockStackRouter: mockStackRouter,
        );
        final finderButton = find.byType(GestureDetector);
        await tester.ensureVisible(finderButton);
        await tester.tap(finderButton);
        await tester.pump(kDoubleTapMinTime);
        await tester.tap(finderButton);
        await tester.pumpAndSettle();
        verify(() => mockStackRouter.pop()).called(1);
      },
    );
  });
}
