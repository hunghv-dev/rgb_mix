import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bloc/rgb_bloc.dart';
import '../data/clipboard.dart';
import '../features/copied/page_copied.dart';
import '../features/home/page_home.dart';
import '../features/splash/page_splash.dart';

class Di {
  static PageSplash get providerPageSplash => const PageSplash();

  static CopyClipboard get providerCopyClipboard => CopyClipboard();

  static Future<SharedPreferences> get providerSharedPreferences =>
      SharedPreferences.getInstance();

  static Future<RgbBloc> get providerRgbBloc async => RgbBloc(
        clipboard: providerCopyClipboard,
        sharedPreferences: await providerSharedPreferences,
      );

  static PageHome get providerPageHome => const PageHome();

  static MaterialPageRoute providerPageHomeRouter(RgbBloc bloc) =>
      MaterialPageRoute(
        builder: (_) => BlocProvider<RgbBloc>.value(
          value: bloc,
          child: providerPageHome,
        ),
      );

  static PageCopied get providerPageCopied => const PageCopied();

  static MaterialPageRoute providerPageCopiedRouter(RgbBloc bloc) =>
      MaterialPageRoute(
        builder: (_) => BlocProvider<RgbBloc>.value(
          value: bloc,
          child: providerPageCopied,
        ),
      );
}
