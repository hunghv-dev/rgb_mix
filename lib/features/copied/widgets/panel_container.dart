import 'package:flutter/material.dart';
import 'package:rgb_mix/features/home/widgets/slider/background_slider.dart';

import 'container_info.dart';

class PanelContainer extends StatefulWidget {
  const PanelContainer({Key? key}) : super(key: key);

  @override
  State<PanelContainer> createState() => _PanelContainerState();
}

class _PanelContainerState extends State<PanelContainer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _zoomController;
  late final Animation<double> _zoomAnimation;

  @override
  void initState() {
    _zoomController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _zoomAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _zoomController, curve: Curves.elasticOut),
    );
    super.initState();
  }

  @override
  void dispose() {
    _zoomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundSlider(
          onHeroAnimationComplete: () => _zoomController.forward(),
        ),
        ContainerInfo(
          zoomAnimation: _zoomAnimation,
        ),
      ],
    );
  }
}
