import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/features/home/widgets/color_overview/color_overview.dart';
import 'package:rgb_mix/features/home/widgets/label_color/label_hex_color.dart';
import 'package:rgb_mix/features/home/widgets/slider/background_slider.dart';
import 'package:rgb_mix/features/home/widgets/slider/slider_progress.dart';
import 'package:rgb_mix/resources/strings.dart';

import '../copied/page_copied.dart';
import '../splash/widgets/label_logo_app.dart';
import '../splash/widgets/logo_circle_white.dart';
import 'widgets/button_process.dart';

class PageHome extends StatelessWidget {
  static const route = '/home';

  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RgbBloc>()..add(InitRgbEvent());
    return BlocListener<RgbBloc, RgbState>(
      listener: (context, state) {
        if (state.isCopied) {
          Navigator.pushNamed(context, PageCopied.route);
        }
      },
      child: Scaffold(
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
                      physics: const BouncingScrollPhysics(),
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
                            children: [
                              const BackgroundSlider(),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 15,
                                child: BlocSelector<RgbBloc, RgbState, bool>(
                                  selector: (state) => state.isCopied,
                                  builder: (_, isCopied) {
                                    return AnimatedOpacity(
                                      duration:
                                          const Duration(milliseconds: 50),
                                      opacity: isCopied ? 0 : 1,
                                      child: AnimatedScale(
                                          duration:
                                              const Duration(milliseconds: 50),
                                          scale: isCopied ? 1.1 : 1.0,
                                          child: const SliderProgress()),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ButtonProcess(
                    label: StringResources.labelButtonCopy,
                    onTap: () {
                      bloc.add(SetDataClipboardEvent());
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
