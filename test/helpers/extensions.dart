import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/features/home/widgets/label_color/label_color_code.dart';
import 'package:rgb_mix/resources/strings.dart';

import 'helpers.dart';

extension WidgetTesterExt on WidgetTester {
  Future<void> pumpApp({
    RgbBloc? bloc,
    required Widget child,
    MockNavigator? navigator,
  }) {
    return pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            if (bloc != null)
              BlocProvider.value(value: bloc)
            else
              BlocProvider(create: (_) => MockRgbBloc()),
          ],
          child: navigator == null
              ? child
              : MockNavigatorProvider(
                  navigator: navigator,
                  child: child,
                ),
        ),
      ),
    );
  }

  List<String> get listLabelHexColor {
    final listWidgetText =
        widgetList<SingleChildScrollView>(find.byType(SingleChildScrollView))
            .toList();
    final itemHeight =
        widget<LabelColorCode>(find.byType(LabelColorCode).first).height;
    return listWidgetText
        .where((e) => e.controller != null)
        .map((e) =>
            StringResources.listHexString[e.controller!.offset ~/ itemHeight])
        .toList();
  }
}
