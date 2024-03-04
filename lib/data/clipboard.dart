import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@injectable
class CopyClipboard {
  Future<bool> setData(String text) =>
      Clipboard.setData(ClipboardData(text: text)).then((_) => true);
}
