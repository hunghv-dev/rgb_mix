import 'package:base_define/base_define.dart';
import 'package:base_ui/base_ui.dart';
import 'package:flutter/material.dart';
import 'package:rgb_mix/resources/strings.dart';
import 'package:rgb_mix/utils/ext.dart';

class BackgroundSlider extends StatelessWidget {
  final VoidCallback? onHeroAnimationComplete;
  final VoidCallback? onHeroAnimationReverse;
  final double width;
  final double height;

  const BackgroundSlider({
    super.key,
    this.onHeroAnimationComplete,
    this.onHeroAnimationReverse,
    this.width = double.infinity,
    this.height = 250,
  });

  @override
  Widget build(BuildContext context) => Hero(
        tag: StringResources.heroTagPanel,
        child: CustomPaint(
          painter: Painter(
              color: ColorsDefine(
                      light: Colors.black12, dark: const Color(0xff061116))
                  .of(context)),
          size: Size(width, height),
        ),
        flightShuttleBuilder: (_, animation, __, ___, context) {
          animation.addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              onHeroAnimationComplete?.call();
            }
            if (status == AnimationStatus.dismissed) {
              onHeroAnimationReverse?.call();
            }
          });
          return context.widget;
        },
      );
}

class Painter extends CustomPainter {
  final Color color;

  Painter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.height / 5;
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
