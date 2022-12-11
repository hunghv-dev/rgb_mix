import 'package:flutter/services.dart';

import '../bloc/rgb_bloc.dart';

class CopyClipboard {
  Future<bool> setData(String text) =>
      Clipboard.setData(ClipboardData(text: text)).then((_) => true);
}
