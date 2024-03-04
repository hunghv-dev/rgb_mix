import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../resources/strings.dart';
import 'clipboard.dart';

@injectable
class Repository {
  final SharedPreferences _sharedPreferences;
  final CopyClipboard _clipboard;

  Repository(this._sharedPreferences, this._clipboard);

  String getRed() =>
      _sharedPreferences.getString(StringResources.prefsTagRedColorCode) ??
      StringResources.textColorCodeZero;

  Future<void> setRed(String color) =>
      _sharedPreferences.setString(StringResources.prefsTagRedColorCode, color);

  String getGreen() =>
      _sharedPreferences.getString(StringResources.prefsTagGreenColorCode) ??
      StringResources.textColorCodeZero;

  Future<void> setGreen(String color) => _sharedPreferences.setString(
      StringResources.prefsTagGreenColorCode, color);

  String getBlue() =>
      _sharedPreferences.getString(StringResources.prefsTagBlueColorCode) ??
      StringResources.textColorCodeZero;

  Future<void> setBlue(String color) => _sharedPreferences.setString(
      StringResources.prefsTagBlueColorCode, color);

  Future<void> saveClipboard(String color) => _clipboard.setData(color);
}
