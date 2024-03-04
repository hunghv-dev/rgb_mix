import 'package:auto_route/auto_route.dart';
import 'package:base_define/base_define.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/resources/strings.dart';

import '../../bloc/rgb_bloc.dart';

@RoutePage()
class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocBuilder<RgbBloc, RgbState>(
          builder: (context, state) => GestureDetector(
            onDoubleTap: AutoRouter.of(context).pop,
            child: Hero(
              tag: StringResources.heroTagOverview,
              child: Container(color: state.color.color),
            ),
          ),
        ),
      );
}
