import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/features/home/widgets/slider/slider_line.dart';

class SliderProgress extends StatelessWidget {
  const SliderProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RgbBloc>();
    return Container(
      height: 250,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SliderLine(
              onChange: (hexValue) => bloc.add(ChangeRed(hexValue)),
              color: Colors.red,
            ),
            SliderLine(
              onChange: (hexValue) => bloc.add(ChangeGreen(hexValue)),
              color: Colors.green,
            ),
            SliderLine(
              onChange: (hexValue) => bloc.add(ChangeBlue(hexValue)),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
