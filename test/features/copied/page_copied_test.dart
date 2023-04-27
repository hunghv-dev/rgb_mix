import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/features/copied/page_copied.dart';
import 'package:rgb_mix/features/home/widgets/button_process.dart';

import '../../helpers/helpers.dart';

void main() {
  late RgbBloc bloc;

  setUp(() {
    bloc = MockRgbBloc();
  });

  group('Page Copied', () {
    testWidgets(
        'start with LabelHexColor: #000000, CircleAvatar color: Colors.black',
        (tester) async {
      when(() => bloc.state).thenReturn(const RgbState.init());
      await tester.pumpApp(bloc: bloc, child: const PageCopied());
      expect(tester.listLabelHexColor, ['0', '0', '0', '0', '0', '0']);
      expect(
          (tester.widget<CircleAvatar>(find.byType(CircleAvatar)))
              .backgroundColor,
          Colors.black);
    });

    testWidgets('pop back when tap to MixAgain button', (tester) async {
      when(() => bloc.state).thenReturn(const RgbState.init());
      await tester.pumpApp(bloc: bloc, child: const PageCopied());
      final finderButton = find.byType(ButtonProcess);
      await tester.ensureVisible(finderButton);
      await tester.tap(finderButton);
      await tester.pumpAndSettle();
      expect(find.byType(PageCopied), findsNothing);
    });
  });
}
