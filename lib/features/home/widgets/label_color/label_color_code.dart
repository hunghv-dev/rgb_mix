import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/resources/enum.dart';
import 'package:rgb_mix/resources/strings.dart';
import 'package:rgb_mix/utils/ext.dart';

class LabelColorCode extends StatelessWidget {
  final double height;
  final double width;
  late final ScrollController _scrollController;
  final double fontSizeLabel;
  final int duration;
  final LabelColorIndex index;

  LabelColorCode({
    Key? key,
    this.height = 50.0,
    this.width = 28.0,
    this.fontSizeLabel = 40,
    this.duration = 300,
    required this.index,
  }) : super(key: key);

  double _scrollIndex(RgbState state) =>
      StringResources.listHexString.indexOf(state.color[index.index + 2]) *
      height;

  @override
  Widget build(BuildContext context) {
    _scrollController = ScrollController(
      initialScrollOffset: _scrollIndex(context.read<RgbBloc>().state),
    );
    return BlocListener<RgbBloc, RgbState>(
      listener: (_, state) {
        final scrollIndex = _scrollIndex(state);
        if (_scrollController.offset == scrollIndex) return;
        _scrollController.animateTo(
          scrollIndex,
          duration: Duration(milliseconds: duration),
          curve: Curves.linear,
        );
      },
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _scrollController,
          child: Column(
            children: StringResources.listHexString
                .map(
                  (e) => Container(
                    alignment: Alignment.center,
                    height: height,
                    child: Text(
                      e,
                      style: TextStyle(
                        color: index.toColor,
                        fontSize: fontSizeLabel,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
