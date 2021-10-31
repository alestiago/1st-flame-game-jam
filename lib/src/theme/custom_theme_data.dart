import 'package:flame_game_jam/src/theme/core/core.dart';
import 'package:flutter/material.dart';

class CustomThemeData {
  static final ThemeData theme = ThemeData(
    colorScheme: CustomColorScheme.dark,
    scaffoldBackgroundColor: CustomColorScheme.dark.background,
  );
}
