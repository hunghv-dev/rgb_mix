import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/resources/enum.dart';
import 'package:rgb_mix/resources/strings.dart';

class LabelColorCode extends StatefulWidget {
  final double height;
  final double width;
  final double fontSizeLabel;
  final int duration;
  final ColorLabel colorLabel;

  const LabelColorCode({
    super.key,
    this.height = 50.0,
    this.width = 28.0,
    this.fontSizeLabel = 40,
    this.duration = 300,
    required this.colorLabel,
  });

  @override
  State<LabelColorCode> createState() => _LabelColorCodeState();
}

class _LabelColorCodeState extends State<LabelColorCode> {
  late final ScrollController _scrollController = ScrollController(
    initialScrollOffset: _scrollIndex(context.read<RgbBloc>().state),
  );

  double _scrollIndex(RgbState state) {
    return StringResources.listHexString
            .indexOf(state.color[widget.colorLabel.index + 2]) *
        widget.height;
  }

  void _scroll(RgbState state) {
    _scrollController.animateTo(
      _scrollIndex(state),
      duration: Duration(milliseconds: widget.duration),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) => BlocListener<RgbBloc, RgbState>(
        listener: (_, state) => _scroll(state),
        child: Container(
          height: widget.height,
          width: widget.width,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _scrollController,
            child: Column(
              children: StringResources.listHexString
                  .map(
                    (e) => Container(
                      alignment: Alignment.center,
                      height: widget.height,
                      child: Text(
                        e,
                        style: TextStyle(
                          color: widget.colorLabel.color,
                          fontSize: widget.fontSizeLabel,
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
