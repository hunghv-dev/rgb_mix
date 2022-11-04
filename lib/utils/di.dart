import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/rgb_bloc.dart';
import '../data/clipboard.dart';
import '../features/copied/page_copied.dart';
import '../features/home/page_home.dart';
import '../features/splash/page_splash.dart';

class Di {
  static PageSplash get providerPageSplash => const PageSplash();

  static MaterialPageRoute get providerPageHomeRouter => MaterialPageRoute(
        builder: (_) {
          final bloc = RgbBloc();
          return BlocProvider<RgbBloc>.value(
            value: bloc,
            child: PageHome(
              clipboard: CopyClipboard(bloc),
            ),
          );
        },
      );

  static PageCopied get providerPageCopied => const PageCopied();

  static MaterialPageRoute providerPageCopiedRouter(BuildContext context) =>
      MaterialPageRoute(
        builder: (_) => BlocProvider<RgbBloc>.value(
          value: context.read<RgbBloc>(),
          child: providerPageCopied,
        ),
      );
}
