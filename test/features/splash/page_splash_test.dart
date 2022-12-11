import 'package:flutter_test/flutter_test.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/features/home/page_home.dart';
import 'package:rgb_mix/features/splash/page_splash.dart';
import 'package:rgb_mix/features/splash/widgets/label_logo_app.dart';
import 'package:rgb_mix/features/splash/widgets/logo_circle_white.dart';
import 'package:rgb_mix/utils/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/exts.dart';

void main() {
  late final RgbBloc bloc;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    bloc = await Di.providerRgbBloc;
  });

  group('Page Splash', () {
    testWidgets('visible with LogoCircleWhite, LabelLogoApp widget',
        (tester) async {
      await tester.pumpPageSplash(bloc);
      expect(find.byType(LogoCircleWhite), findsOneWidget);
      expect(find.byType(LabelLogoApp), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(PageSplash), findsNothing);
    });

    testWidgets('exit after complete of animation', (tester) async {
      await tester.pumpPageSplash(bloc);
      expect(find.byType(PageSplash), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(PageSplash), findsNothing);
      expect(find.byType(PageHome), findsOneWidget);
    });
  });
}
