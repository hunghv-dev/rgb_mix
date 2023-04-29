import 'package:flutter/material.dart';

import '../../../resources/colors.dart';

class ButtonProcess extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const ButtonProcess({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'ButtonProcess',
      child: SizedBox(
        width: 150,
        height: 40,
        child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              backgroundColor: ColorResources.bgSlider),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
