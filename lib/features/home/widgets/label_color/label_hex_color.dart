import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/features/home/widgets/label_color/label_color_code.dart';
import 'package:rgb_mix/resources/enum.dart';
import 'package:rgb_mix/resources/strings.dart';
import 'package:rgb_mix/utils/ext.dart';

class LabelHexColor extends StatefulWidget {
  const LabelHexColor({Key? key}) : super(key: key);

  @override
  State<LabelHexColor> createState() => _LabelHexColorState();
}

class _LabelHexColorState extends State<LabelHexColor> {
  bool? _isScrollUp;

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
              child: GestureDetector(
                  onPanUpdate: (details) {
                    if (details.isDragUp) {
                      setState(() => _isScrollUp = true);
                    }
                    if (details.isDragDown) {
                      setState(() => _isScrollUp = false);
                    }
                  },
                  onPanEnd: (_) {
                    if (_isScrollUp == null) return;
                    context.read<RgbBloc>().add(
                          _isScrollUp!
                              ? IncreaseRgbEvent(e.labelColor)
                              : DecreaseRgbEvent(e.labelColor),
                        );
                    _isScrollUp = null;
                  },
                  child: LabelColorCode(index: e)),
            ),
          ),
        ],
      ),
    );
  }
}
