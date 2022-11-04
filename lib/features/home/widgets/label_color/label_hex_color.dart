import 'package:flutter/material.dart';
import 'package:rgb_mix/features/home/widgets/label_color/label_color_code.dart';
import 'package:rgb_mix/resources/enum.dart';
import 'package:rgb_mix/resources/strings.dart';

class LabelHexColor extends StatelessWidget {
  const LabelHexColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Text(
              StringResources.labelNumberSign,
              style: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontSize: 40,
              ),
            ),
          ),
          ...LabelColorIndex.values.map(
            (e) => WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: LabelColorCode(index: e),
            ),
          ),
        ],
      ),
    );
  }
}
