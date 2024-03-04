import 'package:flutter/material.dart';
import 'package:rgb_mix/features/home/widgets/color_overview/color_painter.dart';

class Blue extends StatelessWidget {
  final double value;
  final double size;
  final double strokeWidth;

  const Blue({
    super.key,
    required this.value,
    this.size = 300,
    this.strokeWidth = 40,
  });

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: ColorPainter(
          strokeWidthMax: strokeWidth,
          color: Colors.blue.withOpacity(0.3),
          startAngle: 0,
          sweepAngle: 60,
        ),
        foregroundPainter: ColorPainter(
          strokeWidthValue: value,
          strokeWidthMax: strokeWidth,
          color: Colors.blue,
          startAngle: 0,
          sweepAngle: 60,
        ),
        size: Size.square(size),
      );
}
