import 'package:base_define/base_define.dart';
import 'package:flutter/material.dart';
import 'package:rgb_mix/utils/ext.dart';

class SliderLine extends StatefulWidget {
  final Color color;
  final double value;
  final ValueChanged<String> onChange;

  const SliderLine({
    super.key,
    required this.color,
    this.value = 0,
    required this.onChange,
  });

  @override
  State<SliderLine> createState() => _SliderLineState();
}

class _SliderLineState extends State<SliderLine> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  void didUpdateWidget(covariant SliderLine oldWidget) {
    super.didUpdateWidget(oldWidget);
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.zero.vertical5,
        child: Row(
          children: [
            Container(
              height: 30,
              width: 8,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: widget.color,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.zero.horizontal30,
                child: Slider(
                  value: _value,
                  onChanged: (value) => setState(
                    () => widget.onChange((_value = value).hex),
                  ),
                  min: 0,
                  thumbColor: widget.color,
                  inactiveColor: widget.color.withOpacity(0.5),
                  activeColor: widget.color,
                  max: 255,
                ),
              ),
            ),
          ],
        ),
      );
}
