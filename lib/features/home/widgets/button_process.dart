import 'package:base_define/base_define.dart';
import 'package:base_ui/base_ui.dart';
import 'package:flutter/material.dart';

import '../../../resources/strings.dart';

class ButtonProcess extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const ButtonProcess({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Hero(
        tag: StringResources.heroTagButtonProcess,
        child: SizedBox(
          width: 150,
          height: 40,
          child: OutlinedButton(
            onPressed: onTap,
            style: OutlinedButton.styleFrom(
                side: BorderSide(
                    color: ColorsDefine.black().of(context), width: 0.5),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                backgroundColor: ColorsDefine(
                        light: Colors.black12, dark: const Color(0xff061116))
                    .of(context)),
            child: Text(
              label,
              style: const TextStyle().s15.c(ColorsDefine.black().of(context)),
            ),
          ),
        ),
      );
}
