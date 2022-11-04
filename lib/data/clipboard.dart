import 'package:flutter/services.dart';

import '../bloc/rgb_bloc.dart';

class CopyClipboard {
  final RgbBloc bloc;

  CopyClipboard(this.bloc);

  Future<bool> get setData =>
      Clipboard.setData(ClipboardData(text: bloc.state.colorCopy))
          .then((_) => true);
}
