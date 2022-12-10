import 'package:flutter/material.dart';
import 'package:rgb_mix/features/home/widgets/color_overview/color_overview.dart';
import 'package:rgb_mix/features/home/widgets/label_color/label_hex_color.dart';
import 'package:rgb_mix/features/home/widgets/slider/background_slider.dart';
import 'package:rgb_mix/features/home/widgets/slider/slider_progress.dart';
import 'package:rgb_mix/resources/strings.dart';

import '../../data/clipboard.dart';
import '../../utils/di.dart';
import '../splash/widgets/label_logo_app.dart';
import '../splash/widgets/logo_circle_white.dart';
import 'widgets/button_process.dart';

class PageHome extends StatelessWidget {
  final CopyClipboard clipboard;

  const PageHome({Key? key, required this.clipboard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              left: -300,
              right: -300,
              bottom: 0,
              top: 0,
              child: Opacity(
                opacity: 0,
                child: LogoCircleWhite(),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const LabelLogoApp(),
                        const SizedBox(height: 50),
                        const ColorOverview(size: 200),
                        const SizedBox(height: 35),
                        const LabelHexColor(),
                        const SizedBox(height: 35),
                        Stack(
                          children:  const [
                            BackgroundSlider(),
                            Positioned(
                                left: 0,
                                right: 0,
                                bottom: 15,
                                child: SliderProgress())
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ButtonProcess(
                  label: StringResources.labelButtonCopy,
                  onTap: () => clipboard.setData.then(
                    (_) => Navigator.push(
                      context,
                      Di.providerPageCopiedRouter(context),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
