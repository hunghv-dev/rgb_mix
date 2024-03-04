import 'package:auto_route/auto_route.dart';
import 'package:base_ui/base_ui.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/data/clipboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockThemeCubit extends Mock implements ThemeCubit {}

class MockRgbBloc extends MockBloc<RgbEvent, RgbState> implements RgbBloc {}

class MockCopyClipboard extends Mock implements CopyClipboard {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockStackRouter extends Mock implements StackRouter {}

class FakePageRouteInfo extends Fake implements PageRouteInfo {}
