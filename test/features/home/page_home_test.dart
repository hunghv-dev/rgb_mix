import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/data/clipboard.dart';
import 'package:rgb_mix/data/repository.dart';
import 'package:rgb_mix/features/home/home_page.dart';
import 'package:rgb_mix/features/home/widgets/button_process.dart';
import 'package:rgb_mix/features/home/widgets/label_color/label_color_code.dart';
import 'package:rgb_mix/resources/strings.dart';
import 'package:rgb_mix/utils/app_router.gr.dart';

import '../../helpers/helpers.dart';

void main() {
  late CopyClipboard clipboard;
  late MockSharedPreferences sharedPreferences;
  late Repository repository;
  late RgbBloc bloc;
  late MockStackRouter mockStackRouter;

  setUpAll(() {
    registerFallbackValue(FakePageRouteInfo());
  });

  setUp(() {
    clipboard = MockCopyClipboard();
    sharedPreferences = MockSharedPreferences();
    repository = Repository(sharedPreferences, clipboard);
    bloc = MockRgbBloc();
    mockStackRouter = MockStackRouter();
    when(() => clipboard.setData(any())).thenAnswer((_) async => true);
    when(() => sharedPreferences.setString(any(), any()))
        .thenAnswer((_) async => true);
  });

  group('Page Home', () {
    testWidgets(
        'start with 3 SliderLine value: 0, LabelHexColor: #000000, CircleAvatar color: Colors.black',
        (tester) async {
      when(() => bloc.state).thenReturn(const RgbState());
      await tester.pumpApp(bloc: bloc, child: const HomePage());
      expect(
          (tester.widgetList<Slider>(find.byType(Slider))).map((e) => e.value),
          [0, 0, 0]);
      expect(tester.listLabelHexColor, ['0', '0', '0', '0', '0', '0']);
      expect(
          (tester.widget<CircleAvatar>(find.byType(CircleAvatar)))
              .backgroundColor,
          Colors.black);
    });

    testWidgets('drag slider for change label hex color', (tester) async {
      final bloc = RgbBloc(repository);
      await tester.pumpApp(bloc: bloc, child: const HomePage());
      final listSlider = find.byType(Slider);
      await tester.ensureVisible(listSlider.at(0));
      await tester.drag(listSlider.at(0), const Offset(50, 0));
      await tester.ensureVisible(listSlider.at(1));
      await tester.drag(listSlider.at(1), const Offset(50, 0));
      await tester.ensureVisible(listSlider.at(2));
      await tester.drag(listSlider.at(2), const Offset(50, 0));
      await tester.pumpAndSettle();
      expect(tester.listLabelHexColor, isNot(['0', '0', '0', '0', '0', '0']));
    });

    testWidgets('drag label hex color up and down for value changed',
        (tester) async {
      final bloc = RgbBloc(repository);
      await tester.pumpApp(bloc: bloc, child: const HomePage());

      /// red color label
      final redLabelColorCode = find.byType(LabelColorCode).at(1);
      await tester.ensureVisible(redLabelColorCode);
      var firstLocation = tester.getCenter(redLabelColorCode);
      var secondLocation = -firstLocation.translate(0, 1);
      await tester.dragFrom(firstLocation, secondLocation);
      await tester.pumpAndSettle();
      expect(tester.listLabelHexColor, ['0', '1', '0', '0', '0', '0']);
      secondLocation = firstLocation.translate(0, 1);
      await tester.dragFrom(firstLocation, secondLocation);
      await tester.pumpAndSettle();
      expect(tester.listLabelHexColor, ['0', '0', '0', '0', '0', '0']);

      /// green color label
      final greenLabelColorCode = find.byType(LabelColorCode).at(3);
      await tester.ensureVisible(greenLabelColorCode);
      firstLocation = tester.getCenter(greenLabelColorCode);
      secondLocation = -firstLocation.translate(0, 1);
      await tester.dragFrom(firstLocation, secondLocation);
      await tester.pumpAndSettle();
      expect(tester.listLabelHexColor, ['0', '0', '0', '1', '0', '0']);
      secondLocation = firstLocation.translate(0, 1);
      await tester.dragFrom(firstLocation, secondLocation);
      await tester.pumpAndSettle();
      expect(tester.listLabelHexColor, ['0', '0', '0', '0', '0', '0']);

      /// blue color label
      final blueLabelColorCode = find.byType(LabelColorCode).at(5);
      await tester.ensureVisible(blueLabelColorCode);
      firstLocation = tester.getCenter(blueLabelColorCode);
      secondLocation = -firstLocation.translate(0, 1);
      await tester.dragFrom(firstLocation, secondLocation);
      await tester.pumpAndSettle();
      expect(tester.listLabelHexColor, ['0', '0', '0', '0', '0', '1']);
      secondLocation = firstLocation.translate(0, 1);
      await tester.dragFrom(firstLocation, secondLocation);
      await tester.pumpAndSettle();
      expect(tester.listLabelHexColor, ['0', '0', '0', '0', '0', '0']);
    });

    testWidgets(
        'change state to ADB0B2 and after: LabelHexColor: #ADB0B2 CircleAvatar color: Colors.grey',
        (tester) async {
      when(() => bloc.state).thenReturn(
          const RgbState(red: 'AD', green: 'B0', blue: 'B2', isCopied: false));
      await tester.pumpApp(bloc: bloc, child: const HomePage());
      expect(tester.listLabelHexColor, ['A', 'D', 'B', '0', 'B', '2']);
      expect(
          (tester.widget<CircleAvatar>(find.byType(CircleAvatar)))
              .backgroundColor,
          const Color(0xffADB0B2));
    });

    testWidgets(
      'Tap Copy button => navigate',
      (tester) async {
        await tester.pumpApp(
          bloc: RgbBloc(repository),
          child: const HomePage(),
          mockStackRouter: mockStackRouter,
        );
        final finderButton = find.byType(ButtonProcess);
        await tester.ensureVisible(finderButton);
        await tester.tap(finderButton);
        await tester.pumpAndSettle();
        verify(() => mockStackRouter.push(const CopiedRoute())).called(1);
      },
    );

    testWidgets(
      'Double Tap Copy button => navigate',
      (tester) async {
        await tester.pumpApp(
          bloc: RgbBloc(repository),
          child: const HomePage(),
          mockStackRouter: mockStackRouter,
        );
        final finderButton =
            find.byKey(const ValueKey(StringResources.testKeyNavigateOverview));
        await tester.tap(finderButton);
        await tester.pump(kDoubleTapMinTime);
        await tester.tap(finderButton);
        await tester.pumpAndSettle();
        verify(() => mockStackRouter.push(const OverviewRoute())).called(1);
      },
    );
  });
}
