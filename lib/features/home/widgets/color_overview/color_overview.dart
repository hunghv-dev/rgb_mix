import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/features/home/widgets/color_overview/red.dart';
import 'package:rgb_mix/utils/ext.dart';

import 'blue.dart';
import 'green.dart';

class ColorOverview extends StatelessWidget {
  final double size;
  final double strokeWidth;

  const ColorOverview({
    required this.size,
    this.strokeWidth = RgbState.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: Stack(
        children: [
          Center(
            child: BlocBuilder<RgbBloc, RgbState>(
              builder: (_, state) {
                return CircleAvatar(
                  backgroundColor: state.color.toColor,
                  radius: size / 4,
                );
              },
            ),
          ),
          BlocBuilder<RgbBloc, RgbState>(
            builder: (context, state) {
              return Red(
                value: state.redStrokeValue,
                size: size,
                strokeWidth: strokeWidth,
              );
            },
          ),
          BlocBuilder<RgbBloc, RgbState>(
            builder: (context, state) {
              return Green(
                value: state.greenStrokeValue,
                size: size,
                strokeWidth: strokeWidth,
              );
            },
          ),
          BlocBuilder<RgbBloc, RgbState>(
            builder: (context, state) {
              return Blue(
                value: state.blueStrokeValue,
                size: size,
                strokeWidth: strokeWidth,
              );
            },
          ),
        ],
      ),
    );
  }
}
