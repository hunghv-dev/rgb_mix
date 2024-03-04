import 'package:base_define/base_define.dart';
import 'package:base_ui/base_ui.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/features/home/widgets/label_color/label_color_code.dart';
import 'package:rgb_mix/resources/enum.dart';
import 'package:rgb_mix/resources/strings.dart';

class LabelHexColor extends StatelessWidget {
  const LabelHexColor({super.key});

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Text(
                StringResources.labelNumberSign,
                style: const TextStyle().s40.c(Colors.grey.withOpacity(0.5)),
              ),
            ),
            ...ColorLabel.values.mapIndexed(
              (index, e) => WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: DragDetector(
                    up: () => context
                        .read<RgbBloc>()
                        .add(RgbEvent.touch(e, increase: true)),
                    down: () => context
                        .read<RgbBloc>()
                        .add(RgbEvent.touch(e, increase: false)),
                    child: LabelColorCode(colorLabel: e)),
              ),
            ),
          ],
        ),
      );
}
