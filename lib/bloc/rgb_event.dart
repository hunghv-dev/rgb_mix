part of 'rgb_bloc.dart';

class RgbEvent extends Equatable {
  final String value;

  const RgbEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class ChangeRed extends RgbEvent {
  const ChangeRed(super.value);
}

class ChangeGreen extends RgbEvent {
  const ChangeGreen(super.value);
}

class ChangeBlue extends RgbEvent {
  const ChangeBlue(super.value);
}
