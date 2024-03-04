import 'package:auto_route/auto_route.dart';
import 'package:base_define/base_define.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/features/home/widgets/color_overview/red.dart';
import 'package:rgb_mix/utils/app_router.gr.dart';

import '../../../../resources/strings.dart';
import 'blue.dart';
import 'green.dart';

class ColorOverview extends StatelessWidget {
  final double size;
  final double strokeWidth;

  const ColorOverview({
    super.key,
    required this.size,
    this.strokeWidth = RgbState.strokeWidth,
  });

  @override
  Widget build(BuildContext context) => SizedBox.square(
        dimension: size,
        child: Stack(
          children: [
            BlocBuilder<RgbBloc, RgbState>(
              builder: (context, state) => Red(
                value: state.redStrokeValue,
                size: size,
                strokeWidth: strokeWidth,
              ),
            ),
            BlocBuilder<RgbBloc, RgbState>(
              builder: (context, state) => Green(
                value: state.greenStrokeValue,
                size: size,
                strokeWidth: strokeWidth,
              ),
            ),
            BlocBuilder<RgbBloc, RgbState>(
              builder: (context, state) => Blue(
                value: state.blueStrokeValue,
                size: size,
                strokeWidth: strokeWidth,
              ),
            ),
            Center(
              child: GestureDetector(
                key: const ValueKey(StringResources.testKeyNavigateOverview),
                onDoubleTap: () =>
                    AutoRouter.of(context).push(const OverviewRoute()),
                child: BlocBuilder<RgbBloc, RgbState>(
                  builder: (context, state) => Hero(
                    tag: StringResources.heroTagOverview,
                    child: CircleAvatar(
                      backgroundColor: state.color.color,
                      radius: size / 4,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
