import 'package:flutter/material.dart';
import 'package:rgb_mix/resources/strings.dart';
import 'package:rgb_mix/utils/ext.dart';

import '../../../../resources/colors.dart';

class BackgroundSlider extends StatelessWidget {
  final VoidCallback? onHeroAnimationComplete;
  final double width;
  final double height;

  const BackgroundSlider({
    Key? key,
    this.onHeroAnimationComplete,
    this.width = double.infinity,
    this.height = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: StringResources.heroTagPanel,
      child: CustomPaint(
        painter: Painter(),
        size: Size(width, height),
      ),
      flightShuttleBuilder: (_, animation, __, ___, context) {
        animation.addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            onHeroAnimationComplete?.call();
          }
        });
        return context.widget;
      },
    );
  }
}

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.height / 6;
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = ColorResources.bgSlider;
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromCenter(
          center: Offset(size.width / 2, (size.height + radius) / 2),
          width: size.width,
          height: size.height - radius,
        ),
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
        topLeft: Radius.circular(radius),
      ),
      paint,
    );
    final path = Path()
      ..moveTo(size.width - radius, radius)
      ..arcTo(
        Rect.fromCircle(center: Offset(size.width - radius, 0), radius: radius),
        (90).toRad,
        (-90).toRad,
        true,
      )
      ..lineTo(size.width, radius);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
