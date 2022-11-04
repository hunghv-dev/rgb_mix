import 'package:flutter_test/flutter_test.dart';
import 'package:rgb_mix/features/home/page_home.dart';
import 'package:rgb_mix/features/splash/page_splash.dart';
import 'package:rgb_mix/features/splash/widgets/label_logo_app.dart';
import 'package:rgb_mix/features/splash/widgets/logo_circle_white.dart';

import '../../helpers/exts.dart';

void main() {
  group('Page Splash', () {
    testWidgets('visible with LogoCircleWhite, LabelLogoApp widget',
        (tester) async {
      await tester.pumpPageSplash;
      expect(find.byType(LogoCircleWhite), findsOneWidget);
      expect(find.byType(LabelLogoApp), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(PageSplash), findsNothing);
    });

    testWidgets('exit after complete of animation', (tester) async {
      await tester.pumpPageSplash;
      expect(find.byType(PageSplash), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(PageSplash), findsNothing);
      expect(find.byType(PageHome), findsOneWidget);
    });
  });
}
