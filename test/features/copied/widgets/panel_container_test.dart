import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/features/copied/widgets/panel_container.dart';
import 'package:rgb_mix/features/home/widgets/slider/background_slider.dart';

import '../../../helpers/helpers.dart';
import '../../home/widgets/slider/background_slider_test.dart';

void main() {
  testWidgets('BackgroundSlider should call shouldRepaint when change size',
      (tester) async {
    final bloc = MockRgbBloc();
    when(() => bloc.state).thenReturn(const RgbState.init());
    await tester.pumpApp(
        bloc: bloc,
        child: MaterialApp(
          home: TestPanelContainer(),
        ));
    final navigate = find.byKey(ValueKey('navigate'));
    await tester.ensureVisible(navigate);
    await tester.tap(navigate);
    await tester.pumpAndSettle();
    final pop = find.byKey(ValueKey('pop'));
    await tester.ensureVisible(pop);
    await tester.tap(pop);
    await tester.pumpAndSettle();
  });
}

class TestPanelContainer extends StatefulWidget {
  @override
  _TestPanelContainerState createState() => _TestPanelContainerState();
}

class _TestPanelContainerState extends State<TestPanelContainer> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          key: Key('navigate'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PanelContainerMock(),
                ));
          },
          child: TestBackgroundSlider()),
    );
  }
}

class PanelContainerMock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        key: Key('pop'),
        onTap: () {
          Navigator.pop(context);
        },
        child: PanelContainer(),
      ),
    );
  }
}
