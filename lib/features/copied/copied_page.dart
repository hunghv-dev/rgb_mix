import 'package:auto_route/auto_route.dart';
import 'package:base_ui/base_ui.dart';
import 'package:flutter/material.dart';
import 'package:rgb_mix/features/copied/widgets/panel_container.dart';
import 'package:rgb_mix/resources/strings.dart';

import '../home/widgets/button_process.dart';
import '../splash/widgets/label_logo_app.dart';

@RoutePage()
class CopiedPage extends StatelessWidget {
  const CopiedPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
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
                onTap: AutoRouter.of(context).pop,
              ),
              Box.h30,
            ],
          ),
        ),
      );
}
