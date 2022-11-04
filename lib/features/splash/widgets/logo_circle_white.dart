import 'package:flutter/material.dart';
import 'package:rgb_mix/utils/ext.dart';

import '../../../resources/strings.dart';

class LogoCircleWhite extends StatelessWidget {
  final double size;
  final double strokeWidth;

  const LogoCircleWhite({
    this.size = 60,
    this.strokeWidth = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: StringResources.heroTagCircle,
      child: CustomPaint(
        painter: Painter(
          strokeWidth: strokeWidth,
        ),
        size: Size.square(size),
      ),
    );
  }
}

class Painter extends CustomPainter {
  final double strokeWidth;

  Painter({
    required this.strokeWidth,
  });

  void _drawArc(Canvas canvas, Size size, int startAngle, int sweepAngle) {
    final paint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.white;

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
    _drawArc(canvas, size, 0, 60);
    _drawArc(canvas, size, 120, 60);
    _drawArc(canvas, size, 240, 60);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
