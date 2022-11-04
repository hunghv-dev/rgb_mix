import 'package:flutter/material.dart';
import 'package:rgb_mix/features/copied/widgets/panel_container.dart';
import 'package:rgb_mix/resources/strings.dart';

import '../home/widgets/button_process.dart';
import '../splash/widgets/label_logo_app.dart';

class PageCopied extends StatelessWidget {
  const PageCopied({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50, bottom: 200),
              child: LabelLogoApp(),
            ),
            const PanelContainer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ButtonProcess(
                label: StringResources.labelButtonMixAgain,
                onTap: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
