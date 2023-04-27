import 'package:flutter/material.dart';
import 'package:rgb_mix/features/copied/widgets/panel_container.dart';
import 'package:rgb_mix/resources/strings.dart';

import '../home/widgets/button_process.dart';
import '../splash/widgets/label_logo_app.dart';

class PageCopied extends StatelessWidget {
  static const route = '/copied';
  const PageCopied({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const LabelLogoApp(),
            const Expanded(
              child:
                  Align(alignment: Alignment.center, child: PanelContainer()),
            ),
            ButtonProcess(
              label: StringResources.labelButtonMixAgain,
              onTap: () => Navigator.pop(context),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
