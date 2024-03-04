import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rgb_mix/features/splash/splash_page.dart';
import 'package:rgb_mix/features/splash/widgets/label_logo_app.dart';
import 'package:rgb_mix/features/splash/widgets/logo_circle_white.dart';
import 'package:rgb_mix/utils/app_router.gr.dart';

import '../../helpers/helpers.dart';

void main() {
  late MockStackRouter mockStackRouter;

  setUpAll(() {
    registerFallbackValue(FakePageRouteInfo());
  });

  setUp(() {
    mockStackRouter = MockStackRouter();
  });

  group('Page Splash', () {
    testWidgets('start => visible: LogoCircleWhite, LabelLogoApp',
        (tester) async {
      await tester.pumpApp(child: const SplashPage());
      expect(find.byType(LogoCircle), findsOneWidget);
      expect(find.byType(LabelLogoApp), findsOneWidget);
    });

    testWidgets(
      'complete of animation => navigate',
      (tester) async {
        await tester.pumpApp(
            child: const SplashPage(), mockStackRouter: mockStackRouter);
        expect(find.byType(SplashPage), findsOneWidget);
        await tester.pumpAndSettle();
        verify(() => mockStackRouter.push(const HomeRoute())).called(1);
      },
    );
  });
}
