import 'package:base_define/base_define.dart';
import 'package:base_ui/base_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/features/home/widgets/label_color/label_hex_color.dart';
import 'package:rgb_mix/resources/strings.dart';

import '../../../bloc/rgb_bloc.dart';

class ContainerInfo extends StatelessWidget {
  final double width;
  final double height;
  final Animation<double> zoomAnimation;

  const ContainerInfo({
    super.key,
    this.width = double.infinity,
    this.height = 300,
    required this.zoomAnimation,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        width: width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<RgbBloc, RgbState>(
              builder: (_, state) => ScaleTransition(
                scale: zoomAnimation,
                child: CircleAvatar(
                  backgroundColor: state.color.color,
                  radius: height / 6,
                  child: Icon(
                    const IconData(0xe156, fontFamily: 'MaterialIcons'),
                    color: state.color.color.invert,
                    size: height / 6,
                  ),
                ),
              ),
            ),
            Box.h30,
            ScaleTransition(scale: zoomAnimation, child: const LabelHexColor()),
            Box.h10,
            Text(
              StringResources.labelTextCopied,
              style: const TextStyle().s20.c(
                  ColorsDefine(light: Colors.black38, dark: Colors.grey)
                      .of(context)),
            ),
          ],
        ),
      );
}
