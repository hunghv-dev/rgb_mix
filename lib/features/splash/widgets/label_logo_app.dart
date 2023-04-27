import 'package:flutter/material.dart';
import 'package:rgb_mix/resources/strings.dart';

class LabelLogoApp extends StatelessWidget {
  final double fontSize;

  const LabelLogoApp({Key? key, this.fontSize = 40}) : super(key: key);

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
  Widget build(BuildContext context) {
    return Hero(
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
              _widgetSpan(StringResources.labelMix, Colors.white,
                  endText: true),
            ],
          ),
        ),
      ),
    );
  }
}
