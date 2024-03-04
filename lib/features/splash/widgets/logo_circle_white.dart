import 'package:flutter/material.dart';
import 'package:rgb_mix/utils/ext.dart';

import '../../../resources/strings.dart';

class LogoCircle extends StatelessWidget {
  final double size;
  final double strokeWidth;

  const LogoCircle({super.key, this.size = 60, this.strokeWidth = 20});

  @override
  Widget build(BuildContext context) => Hero(
        tag: StringResources.heroTagCircle,
        child: CustomPaint(
          painter: Painter(strokeWidth: strokeWidth),
          size: Size.square(size),
        ),
      );
}

class Painter extends CustomPainter {
  final double strokeWidth;

  Painter({required this.strokeWidth});

  void _drawArc(
      Canvas canvas, Size size, int startAngle, int sweepAngle, Color color) {
    final paint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = color;

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2),
        startAngle.toRad,
        sweepAngle.toRad,
        false,
        paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    _drawArc(canvas, size, 0, 60, Colors.red);
    _drawArc(canvas, size, 120, 60, Colors.green);
    _drawArc(canvas, size, 240, 60, Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
