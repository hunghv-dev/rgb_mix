import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rgb_mix/features/home/widgets/slider/background_slider.dart';

import '../../../../helpers/helpers.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(FakePageRouteInfo());
  });

  testWidgets('BackgroundSlider should call shouldRepaint when change size',
      (tester) async {
    await tester.pumpApp(
        child: const MaterialApp(
          home: TestBackgroundSlider(),
        ),
        bloc: MockRgbBloc());
    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();
    expect(find.byType(BackgroundSlider), findsOneWidget);
  });
}

class TestBackgroundSlider extends StatefulWidget {
  const TestBackgroundSlider({super.key});

  @override
  State<TestBackgroundSlider> createState() => _TestBackgroundSliderState();
}

class _TestBackgroundSliderState extends State<TestBackgroundSlider> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: () => setState(() => state = true),
          child: BackgroundSlider(
            height: state ? 250 : 300,
            onHeroAnimationComplete: () {},
            onHeroAnimationReverse: () {},
          )),
    );
  }
}
