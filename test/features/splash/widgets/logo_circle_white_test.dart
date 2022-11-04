import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rgb_mix/features/splash/widgets/logo_circle_white.dart';

void main() {
  testWidgets('LogoCircleWhite should call shouldRepaint when change size',
      (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: TestLogoCircleWhite(),
    ));
    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();
    expect(find.byType(LogoCircleWhite), findsOneWidget);
  });
}

class TestLogoCircleWhite extends StatefulWidget {
  @override
  _TestLogoCircleWhiteState createState() => _TestLogoCircleWhiteState();
}

class _TestLogoCircleWhiteState extends State<TestLogoCircleWhite> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
          onTap: () => setState(() => state = true),
          child: LogoCircleWhite(size: state ? 50 : 60)),
    );
  }
}
