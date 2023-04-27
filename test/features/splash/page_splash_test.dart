import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:rgb_mix/features/splash/page_splash.dart';
import 'package:rgb_mix/features/splash/widgets/label_logo_app.dart';
import 'package:rgb_mix/features/splash/widgets/logo_circle_white.dart';

import '../../helpers/helpers.dart';

void main() {
  late MockNavigator navigator;

  setUp(() async {
    navigator = MockNavigator();
    when(() => navigator.pushNamed(any())).thenAnswer((_) async {});
  });

  group('Page Splash', () {
    testWidgets('start => visible: LogoCircleWhite, LabelLogoApp',
        (tester) async {
      await tester.pumpApp(child: const PageSplash());
      expect(find.byType(LogoCircleWhite), findsOneWidget);
      expect(find.byType(LabelLogoApp), findsOneWidget);
    });

    testWidgets(
      'complete of animation => navigate',
      (tester) async {
        await tester.pumpApp(
          child: const PageSplash(),
          navigator: navigator,
        );
        expect(find.byType(PageSplash), findsOneWidget);
        await tester.pumpAndSettle();
        verify(() => navigator.pushNamed(any())).called(1);
      },
    );
  });
}
