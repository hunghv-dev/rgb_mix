import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/rgb_bloc.dart';
import '../data/clipboard.dart';
import '../features/copied/page_copied.dart';
import '../features/home/page_home.dart';
import '../features/splash/page_splash.dart';

class Di {
  static PageSplash get providerPageSplash => const PageSplash();

  static CopyClipboard get providerCopyClipboard => CopyClipboard();

  static RgbBloc get providerRgbBloc =>
      RgbBloc(clipboard: providerCopyClipboard);

  static PageHome get providerPageHome => const PageHome();

  static MaterialPageRoute get providerPageHomeRouter => MaterialPageRoute(
        builder: (_) => BlocProvider<RgbBloc>(
          create: (_) => providerRgbBloc,
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
