import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/features/home/widgets/slider/slider_line.dart';

class SliderProgress extends StatelessWidget {
  const SliderProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RgbBloc>();
    return Container(
      height: 250,
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocSelector<RgbBloc, RgbState, double>(
              selector: (state) => state.redValue,
              builder: (context, redValue) => SliderLine(
                value: redValue,
                onChange: (hexValue) => bloc.add(RgbEvent.changeRed(hexValue)),
                color: Colors.red,
              ),
            ),
            BlocSelector<RgbBloc, RgbState, double>(
              selector: (state) => state.greenValue,
              builder: (context, greenValue) => SliderLine(
                value: greenValue,
                onChange: (hexValue) =>
                    bloc.add(RgbEvent.changeGreen(hexValue)),
                color: Colors.green,
              ),
            ),
            BlocSelector<RgbBloc, RgbState, double>(
              selector: (state) => state.blueValue,
              builder: (context, blueValue) => SliderLine(
                value: blueValue,
                onChange: (hexValue) => bloc.add(RgbEvent.changeBlue(hexValue)),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
