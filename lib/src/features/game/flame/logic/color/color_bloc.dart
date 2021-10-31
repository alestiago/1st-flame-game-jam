import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/painting.dart';
import 'package:meta/meta.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(const ColorState(Color(0xFFFFFFFF))) {
    on<ColorStartEvent>(_onStart);
    on<ColorNewEvent>(_onNewColor);
  }

  static const colorOffsetValue = 85;
  static final _random = Random();

  void _onStart(ColorStartEvent _, Emitter emit) {
    emit(ColorState(_generateRandomColor()));
  }

  void _onNewColor(ColorNewEvent _, Emitter emit) {
    Color newColor;
    do {
      newColor = _generateRandomColor();
    } while (newColor != state.color &&
        newColor != const Color(0xFFFFFFFF) &&
        newColor != const Color(0xFF000000));

    emit(ColorState(newColor));
  }

  Color _generateRandomColor() {
    var newColor = const Color(0xFFFFFFFF);
    for (var i = 0; i < 3; i++) {
      final option = _random.nextInt(3);

      if (option == 0) {
        newColor =
            newColor.withBlue((newColor.blue - colorOffsetValue).clamp(0, 255));
        newColor = newColor
            .withGreen((newColor.green - colorOffsetValue).clamp(0, 255));
      } else if (option == 1) {
        newColor =
            newColor.withRed((newColor.red - colorOffsetValue).clamp(0, 255));
        newColor = newColor
            .withGreen((newColor.green - colorOffsetValue).clamp(0, 255));
      } else if (option == 2) {
        newColor =
            newColor.withRed((newColor.red - colorOffsetValue).clamp(0, 255));
        newColor =
            newColor.withBlue((newColor.blue - colorOffsetValue).clamp(0, 255));
      }
    }

    return newColor;
  }
}
