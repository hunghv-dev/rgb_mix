import 'package:flutter/material.dart';
import 'package:rgb_mix/features/home/widgets/color_overview/color_painter.dart';

class Red extends StatelessWidget {
  final double value;
  final double size;
  final double strokeWidth;

  const Red({
    super.key,
    required this.value,
    this.size = 300,
    this.strokeWidth = 40,
  });

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: ColorPainter(
          strokeWidthMax: strokeWidth,
          color: Colors.red.withOpacity(0.3),
          startAngle: 120,
          sweepAngle: 60,
        ),
        foregroundPainter: ColorPainter(
          strokeWidthValue: value,
          strokeWidthMax: strokeWidth,
          color: Colors.red,
          startAngle: 120,
          sweepAngle: 60,
        ),
        size: Size.square(size),
      );
}
