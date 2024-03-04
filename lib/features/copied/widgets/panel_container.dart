import 'package:base_define/base_define.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/features/home/widgets/slider/background_slider.dart';

import '../../../bloc/rgb_bloc.dart';
import 'container_info.dart';

class PanelContainer extends StatefulWidget {
  const PanelContainer({super.key});

  @override
  State<PanelContainer> createState() => _PanelContainerState();
}

class _PanelContainerState extends State<PanelContainer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: DurationDefine.ms100);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          BackgroundSlider(
            onHeroAnimationComplete: _controller.forward,
            onHeroAnimationReverse: () =>
                context.read<RgbBloc>().add(const RgbEvent.mixAgain()),
          ),
          ContainerInfo(
            zoomAnimation:
                CurvedAnimation(parent: _controller, curve: Curves.ease),
          ),
        ],
      );
}
