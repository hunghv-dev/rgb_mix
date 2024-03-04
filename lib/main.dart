import 'package:base_define/base_define.dart';
import 'package:base_ui/base_ui.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statusbarz/statusbarz.dart';

import 'bloc/rgb_bloc.dart';
import 'utils/app_router.dart';
import 'utils/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await dependencyInit();
  runApp(
    DevicePreview(
      enabled: false,
      tools: const [...DevicePreview.defaultTools],
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<ThemeCubit>()),
          BlocProvider(create: (_) => getIt<RgbBloc>()),
        ],
        child: const App(),
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => StatusbarzCapturer(
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeDataDefine().of(context),
          routerConfig: getIt<AppRouter>().config(),
        ),
      );
}
