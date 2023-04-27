import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rgb_mix/data/clipboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  test('CopyClipboard test', () async {
    final clipboard = CopyClipboard();
    final result = await clipboard.setData('');
    expect(result, true);
  });
}
