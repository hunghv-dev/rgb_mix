import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/features/overview/page_overview.dart';
import 'package:rgb_mix/resources/colors.dart';
import 'package:rgb_mix/resources/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:statusbarz/statusbarz.dart';

import 'bloc/rgb_bloc.dart';
import 'data/clipboard.dart';
import 'features/copied/page_copied.dart';
import 'features/home/page_home.dart';
import 'features/splash/page_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final bloc = RgbBloc(
    clipboard: CopyClipboard(),
    sharedPreferences: await SharedPreferences.getInstance(),
  );
  runApp(
    DevicePreview(
      enabled: false,
      tools: const [...DevicePreview.defaultTools],
      builder: (context) => BlocProvider(
        create: (_) => bloc,
        child: const App(),
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusbarzCapturer(
      child: MaterialApp(
        navigatorObservers: [Statusbarz.instance.observer],
        debugShowCheckedModeBanner: false,
        title: StringResources.appName,
        routes: {
          PageSplash.route: (context) => const PageSplash(),
          PageHome.route: (context) => const PageHome(),
          PageCopied.route: (context) => const PageCopied(),
          PageOverview.route: (context) => const PageOverview(),
        },
        initialRoute: PageSplash.route,
        theme: ThemeData(
            scaffoldBackgroundColor: ColorResources.bg,
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: ZoomPageTransitionsBuilder(),
                TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
              },
            )),
      ),
    );
  }
}
