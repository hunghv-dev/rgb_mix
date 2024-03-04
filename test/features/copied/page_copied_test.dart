import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/features/copied/copied_page.dart';
import 'package:rgb_mix/features/home/widgets/button_process.dart';

import '../../helpers/helpers.dart';

void main() {
  late RgbBloc bloc;
  late MockStackRouter mockStackRouter;

  setUpAll(() {
    registerFallbackValue(FakePageRouteInfo());
  });

  setUp(() {
    bloc = MockRgbBloc();
    mockStackRouter = MockStackRouter();
  });

  group('Page Copied', () {
    testWidgets(
        'start with LabelHexColor: #000000, CircleAvatar color: Colors.black',
        (tester) async {
      when(() => bloc.state).thenReturn(const RgbState());
      await tester.pumpApp(bloc: bloc, child: const CopiedPage());
      expect(tester.listLabelHexColor, ['0', '0', '0', '0', '0', '0']);
      expect(
          (tester.widget<CircleAvatar>(find.byType(CircleAvatar)))
              .backgroundColor,
          Colors.black);
    });

    testWidgets('pop back when tap to MixAgain button', (tester) async {
      when(() => bloc.state).thenReturn(const RgbState());
      await tester.pumpApp(
        bloc: bloc,
        child: const CopiedPage(),
        mockStackRouter: mockStackRouter,
      );
      final finderButton = find.byType(ButtonProcess);
      await tester.ensureVisible(finderButton);
      await tester.tap(finderButton);
      await tester.pumpAndSettle();
      verify(() => mockStackRouter.pop()).called(1);
    });
  });
}
