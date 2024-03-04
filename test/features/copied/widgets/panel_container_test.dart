import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/features/copied/widgets/panel_container.dart';

import '../../../helpers/helpers.dart';
import '../../home/widgets/slider/background_slider_test.dart';

void main() {
  setUpAll(() {
    registerFallbackValue(FakePageRouteInfo());
  });
  testWidgets('BackgroundSlider should call shouldRepaint when change size',
      (tester) async {
    final bloc = MockRgbBloc();
    when(() => bloc.state).thenReturn(const RgbState());
    await tester.pumpApp(
        bloc: bloc,
        child: const MaterialApp(
          home: TestPanelContainer(),
        ));
    final navigate = find.byKey(const ValueKey('navigate'));
    await tester.ensureVisible(navigate);
    await tester.tap(navigate);
    await tester.pumpAndSettle();
    final pop = find.byKey(const ValueKey('pop'));
    await tester.ensureVisible(pop);
    await tester.tap(pop);
    await tester.pumpAndSettle();
  });
}

class TestPanelContainer extends StatefulWidget {
  const TestPanelContainer({super.key});

  @override
  State<TestPanelContainer> createState() => _TestPanelContainerState();
}

class _TestPanelContainerState extends State<TestPanelContainer> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          key: const Key('navigate'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PanelContainerMock(),
                ));
          },
          child: const TestBackgroundSlider()),
    );
  }
}

class PanelContainerMock extends StatelessWidget {
  const PanelContainerMock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        key: const Key('pop'),
        onTap: () {
          Navigator.pop(context);
        },
        child: const PanelContainer(),
      ),
    );
  }
}
