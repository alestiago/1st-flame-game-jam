part of 'color_bloc.dart';

@immutable
abstract class ColorEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ColorStartEvent extends ColorEvent {}

class ColorNewEvent extends ColorEvent {}
