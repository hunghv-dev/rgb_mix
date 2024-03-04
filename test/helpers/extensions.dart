import 'package:auto_route/auto_route.dart';
import 'package:base_ui/base_ui.dart';
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
    MockStackRouter? mockStackRouter,
  }) async {
    final controller = mockStackRouter ?? MockStackRouter();
    when(() => controller.push(any())).thenAnswer((_) async {});
    when(() => controller.pop()).thenAnswer((_) async => true);
    return pumpWidget(
      MaterialApp(
        home: StackRouterScope(
          controller: controller,
          stateHash: 0,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => ThemeCubit(MockSharedPreferences())),
              if (bloc != null)
                BlocProvider.value(value: bloc)
              else
                BlocProvider(create: (_) => MockRgbBloc()),
            ],
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
