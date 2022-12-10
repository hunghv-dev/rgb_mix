import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/data/clipboard.dart';
import 'package:rgb_mix/features/copied/page_copied.dart';
import 'package:rgb_mix/features/home/page_home.dart';
import 'package:rgb_mix/features/home/widgets/button_process.dart';
import 'package:rgb_mix/features/home/widgets/label_color/label_color_code.dart';
import 'package:rgb_mix/resources/colors.dart';

import '../../helpers/exts.dart';
import '../../helpers/mocks.dart';

void main() {
  late RgbBloc bloc;
  late CopyClipboard clipboard;

  setUp(() {
    bloc = MockRgbBloc();
    clipboard = MockCopyClipboard();
  });

  group('Page Home', () {
    testWidgets(
        'start with 3 SliderLine value: 0, LabelHexColor: #000000, CircleAvatar color: Colors.black',
        (tester) async {
      when(() => bloc.state).thenReturn(const RgbState.init());
      await tester.pumpPageHome(bloc);
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
      final bloc = RgbBloc();
      await tester.pumpPageHome(bloc);
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
      final bloc = RgbBloc();
      await tester.pumpPageHome(bloc);

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
      when(() => bloc.state).thenReturn(const RgbState('AD', 'B0', 'B2'));
      await tester.pumpPageHome(bloc);
      expect(tester.listLabelHexColor, ['A', 'D', 'B', '0', 'B', '2']);
      expect(
          (tester.widget<CircleAvatar>(find.byType(CircleAvatar)))
              .backgroundColor,
          ColorResources.grey);
    });

    testWidgets('navigate to page copied when tap to Copy button',
        (tester) async {
      when(() => bloc.state).thenReturn(const RgbState.init());
      when(() => clipboard.setData).thenAnswer((_) async => true);
      await tester.pumpPageHome(bloc, clipboard);
      final finderButton = find.byType(ButtonProcess);
      await tester.ensureVisible(finderButton);
      await tester.tap(finderButton);
      await tester.pumpAndSettle();
      expect(find.byType(PageHome), findsNothing);
      expect(find.byType(PageCopied), findsOneWidget);
    });
  });
}
