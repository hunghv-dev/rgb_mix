import 'package:auto_route/auto_route.dart';
import 'package:base_define/base_define.dart';
import 'package:flutter/material.dart';
import 'package:rgb_mix/features/splash/widgets/label_logo_app.dart';

import '../../utils/app_router.gr.dart';
import 'widgets/logo_circle_white.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 4),
                duration: DurationDefine.s1,
                builder: (_, value, child) => Transform.rotate(
                  angle: value,
                  child: child,
                ),
                onEnd: () => AutoRouter.of(context).push(const HomeRoute()),
                child: const LogoCircle(),
              ),
              Padding(
                padding: EdgeInsets.zero.all20,
                child: const LabelLogoApp(fontSize: 60),
              ),
            ],
          ),
        ),
      );
}
