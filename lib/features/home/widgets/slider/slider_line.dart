import 'package:flutter/material.dart';
import 'package:rgb_mix/utils/ext.dart';

class SliderLine extends StatefulWidget {
  final Color color;
  final double value;
  final ValueChanged<String> onChange;

  const SliderLine({
    Key? key,
    required this.color,
    this.value = 0,
    required this.onChange,
  }) : super(key: key);

  @override
  State<SliderLine> createState() => _SliderLineState();
}

class _SliderLineState extends State<SliderLine> {
  late double _value;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SliderLine oldWidget) {
    _value = widget.value;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
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
}
