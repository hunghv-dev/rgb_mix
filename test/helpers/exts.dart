import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/data/clipboard.dart';
import 'package:rgb_mix/features/home/page_home.dart';
import 'package:rgb_mix/features/home/widgets/label_color/label_color_code.dart';
import 'package:rgb_mix/resources/strings.dart';
import 'package:rgb_mix/utils/di.dart';

extension WidgetTesterExt on WidgetTester {
  get pumpPageSplash => pumpWidget(
        MaterialApp(
          home: Di.providerPageSplash,
        ),
      );

  Future<void> pumpPageHome(RgbBloc bloc) => pumpWidget(
        MaterialApp(
          home: BlocProvider(
            create: (_) => bloc,
            child: Di.providerPageHome,
          ),
        ),
      );

  Future<void> pumpPageCopied(RgbBloc bloc) => pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: bloc,
            child: Di.providerPageCopied,
          ),
        ),
      );

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
