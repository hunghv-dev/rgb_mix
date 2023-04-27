import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/features/home/widgets/label_color/label_hex_color.dart';
import 'package:rgb_mix/resources/colors.dart';
import 'package:rgb_mix/resources/strings.dart';
import 'package:rgb_mix/utils/ext.dart';

import '../../../bloc/rgb_bloc.dart';

class ContainerInfo extends StatelessWidget {
  final double width;
  final double height;
  final Animation<double> zoomAnimation;

  const ContainerInfo({
    Key? key,
    this.width = double.infinity,
    this.height = 300,
    required this.zoomAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<RgbBloc, RgbState>(builder: (_, state) {
            return ScaleTransition(
              scale: zoomAnimation,
              child: CircleAvatar(
                backgroundColor: state.color.toColor,
                radius: height / 6,
                child: Icon(
                  const IconData(0xe156, fontFamily: 'MaterialIcons'),
                  color: state.color.toColor.invert,
                  size: height / 6,
                ),
              ),
            );
          }),
          const SizedBox(height: 30),
          ScaleTransition(scale: zoomAnimation, child: const LabelHexColor()),
          const SizedBox(height: 10),
          const Text(
            StringResources.labelTextCopied,
            style: TextStyle(color: ColorResources.grey, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
