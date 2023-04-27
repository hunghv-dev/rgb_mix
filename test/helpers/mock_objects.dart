import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rgb_mix/bloc/rgb_bloc.dart';
import 'package:rgb_mix/data/clipboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockRgbBloc extends MockBloc<RgbEvent, RgbState> implements RgbBloc {}

class MockCopyClipboard extends Mock implements CopyClipboard {}

class MockSharedPreferences extends Mock implements SharedPreferences {}
