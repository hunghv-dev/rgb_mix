import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/resources/strings.dart';
import 'package:rgb_mix/utils/ext.dart';

import '../../bloc/rgb_bloc.dart';

class PageOverview extends StatelessWidget {
  static const route = '/overview';

  const PageOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RgbBloc, RgbState>(
        builder: (context, state) {
          return GestureDetector(
            onDoubleTap: () => Navigator.of(context).pop(),
            child: Hero(
              tag: StringResources.heroTagOverview,
              child: Container(
                color: state.color.toColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
