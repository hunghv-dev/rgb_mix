part of 'rgb_bloc.dart';

class RgbEvent {}

class ChangeRgbEvent extends Equatable implements RgbEvent {
  final String value;

  const ChangeRgbEvent(this.value);

  @override
  List<Object?> get props => [value];
}

class ChangeRed extends ChangeRgbEvent {
  const ChangeRed(super.value);
}

class ChangeGreen extends ChangeRgbEvent {
  const ChangeGreen(super.value);
}

class ChangeBlue extends ChangeRgbEvent {
  const ChangeBlue(super.value);
}

class IncreaseRgbEvent extends RgbEvent {
  final LabelColor color;

  IncreaseRgbEvent(this.color);
}

class DecreaseRgbEvent extends RgbEvent {
  final LabelColor color;

  DecreaseRgbEvent(this.color);
}
