import 'package:auto_route/auto_route.dart';
import 'package:base_define/base_define.dart';
import 'package:base_ui/base_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/features/home/widgets/color_overview/color_overview.dart';
import 'package:rgb_mix/features/home/widgets/label_color/label_hex_color.dart';
import 'package:rgb_mix/features/home/widgets/slider/background_slider.dart';
import 'package:rgb_mix/features/home/widgets/slider/slider_progress.dart';
import 'package:rgb_mix/resources/strings.dart';
import 'package:rgb_mix/utils/app_router.gr.dart';

import '../splash/widgets/label_logo_app.dart';
import '../splash/widgets/logo_circle_white.dart';
import 'widgets/button_process.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final RgbBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<RgbBloc>()..add(const RgbEvent.init());
  }

  @override
  Widget build(BuildContext context) => BlocListener<RgbBloc, RgbState>(
        listener: (_, state) {
          if (state.isCopied) {
            AutoRouter.of(context).push(const CopiedRoute());
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
                  child: Opacity(opacity: 0, child: LogoCircle()),
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
                            Box.h50,
                            const ColorOverview(size: 200),
                            Box.h50,
                            const LabelHexColor(),
                            Box.h35,
                            Stack(
                              children: [
                                const BackgroundSlider(),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 15,
                                  child: BlocSelector<RgbBloc, RgbState, bool>(
                                    selector: (state) => state.isCopied,
                                    builder: (_, isCopied) => AnimatedOpacity(
                                      duration: DurationDefine.ms50,
                                      opacity: isCopied ? 0 : 1,
                                      child: AnimatedScale(
                                          duration: DurationDefine.ms50,
                                          scale: isCopied ? 1.1 : 1.0,
                                          child: const SliderProgress()),
                                    ),
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
                      onTap: () => bloc.add(const RgbEvent.setClipboard()),
                    ),
                    Box.h30,
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
