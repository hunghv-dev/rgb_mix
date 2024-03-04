import 'package:base_ui/base_ui.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class SharedPreferencesModule {
  @preResolve
  Future<SharedPreferences> instance() => SharedPreferences.getInstance();
}

@module
abstract class ThemeCubitModule {
  ThemeCubit instance(SharedPreferences preferences) => ThemeCubit(preferences);
}
