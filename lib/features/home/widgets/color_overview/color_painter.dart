import 'package:flutter/material.dart';
import 'package:rgb_mix/utils/ext.dart';

class ColorPainter extends CustomPainter {
  final double? strokeWidthValue;
  final double strokeWidthMax;
  final Color color;
  final int startAngle;
  final int sweepAngle;

  ColorPainter({
    this.strokeWidthValue,
    required this.strokeWidthMax,
    required this.color,
    required this.startAngle,
    required this.sweepAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (strokeWidthValue == 0) return;
    final radius = (size.width + strokeWidthMax) / 2;
    final paint = Paint()
      ..strokeWidth = strokeWidthValue ?? strokeWidthMax
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = color;
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: radius - (strokeWidthValue ?? strokeWidthMax) / 2),
      startAngle.toRad,
      sweepAngle.toRad,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
