part of 'color_bloc.dart';

@immutable
class ColorState extends Equatable {
  const ColorState(this.color);

  final Color color;

  @override
  List<Object?> get props => [color];
}
