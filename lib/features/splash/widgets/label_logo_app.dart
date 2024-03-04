import 'package:base_define/base_define.dart';
import 'package:base_ui/base_ui.dart';
import 'package:flutter/material.dart';
import 'package:rgb_mix/resources/strings.dart';

class LabelLogoApp extends StatelessWidget {
  final double fontSize;

  const LabelLogoApp({super.key, this.fontSize = 40});

  WidgetSpan _widgetSpan(String label, Color color, {bool endText = false}) =>
      WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Text(label,
            style: TextStyle(
              color: color,
              fontSize: endText ? fontSize / 2 : fontSize,
              fontWeight: FontWeight.bold,
            )),
      );

  @override
  Widget build(BuildContext context) => Hero(
        tag: StringResources.heroTagLogo,
        child: Material(
          color: Colors.transparent,
          child: RichText(
            textAlign: TextAlign.end,
            text: TextSpan(
              children: [
                _widgetSpan(StringResources.labelR, Colors.red),
                _widgetSpan(StringResources.labelG, Colors.green),
                _widgetSpan(StringResources.labelB, Colors.blue),
                _widgetSpan(
                    StringResources.labelMix, ColorsDefine.black().of(context),
                    endText: true),
              ],
            ),
          ),
        ),
      );
}
