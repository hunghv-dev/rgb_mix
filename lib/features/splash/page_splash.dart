import 'package:flutter/material.dart';
import 'package:rgb_mix/features/splash/widgets/label_logo_app.dart';

import '../home/page_home.dart';
import 'widgets/logo_circle_white.dart';

class PageSplash extends StatelessWidget {
  static const route = '/';

  const PageSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: 4),
              duration: const Duration(seconds: 1),
              builder: (_, value, child) => Transform.rotate(
                angle: value,
                child: child,
              ),
              onEnd: () {
                Navigator.pushNamed(context, PageHome.route);
              },
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
