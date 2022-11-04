import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/data/clipboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  test('CopyClipboard test', () async {
    final clipboard = CopyClipboard(RgbBloc());
    final result = await clipboard.setData;
    expect(result, true);
  });
}
