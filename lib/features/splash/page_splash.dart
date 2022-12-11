import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/features/splash/widgets/label_logo_app.dart';

import '../../utils/di.dart';
import 'widgets/logo_circle_white.dart';

class PageSplash extends StatefulWidget {
  const PageSplash({Key? key}) : super(key: key);

  @override
  State<PageSplash> createState() => _PageSplashState();
}

class _PageSplashState extends State<PageSplash>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotationController;
  late final RgbBloc bloc;

  void _animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      Navigator.pushReplacement(context, Di.providerPageHomeRouter(bloc));
    }
  }

  @override
  void initState() {
    bloc = context.read<RgbBloc>();
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )
      ..addStatusListener(_animationStatusListener)
      ..forward();
    super.initState();
  }

  @override
  void dispose() {
    _rotationController
      ..removeStatusListener(_animationStatusListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            RotationTransition(
              turns: _rotationController,
              child: const LogoCircleWhite(),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child: LabelLogoApp(fontSize: 60),
            ),
          ],
        ),
      ),
    );
  }
}
