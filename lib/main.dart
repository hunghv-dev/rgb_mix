import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rgb_mix/resources/colors.dart';
import 'package:rgb_mix/resources/strings.dart';
import 'package:rgb_mix/utils/di.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      title: StringResources.appName,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorResources.bg,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
          },
        )
      ),
      home: Di.providerPageSplash,
    );
  }
}
