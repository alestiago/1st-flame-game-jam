import 'package:flutter/material.dart';

class CustomColorScheme {
  static const Color _primary = Color(0xFFAAFFFF);
  static const Color _primaryVariant = Color(0xFFAAFFFF);
  static const Color _onPrimary = Colors.white;

  static const Color _secondary = Color(0xFFAAFFFF);
  static const Color _secondaryVariant = Color(0xFFAAFFFF);
  static const Color _onSecondary = _onPrimary;

  static const Color _surface = Color(0xFFAAFFFF);
  static const Color _onSurface = Colors.black;

  static const Color _background = Color(0xFF241113);
  static const Color _onBackground = Colors.white;

  static const Color _error = Colors.red;
  static const Color _onError = Colors.white;

  static const ColorScheme dark = ColorScheme(
    primary: _primary,
    primaryVariant: _primaryVariant,
    secondary: _secondary,
    secondaryVariant: _secondaryVariant,
    surface: _surface,
    background: _background,
    error: _error,
    onPrimary: _onPrimary,
    onSecondary: _onSecondary,
    onSurface: _onSurface,
    onBackground: _onBackground,
    onError: _onError,
    brightness: Brightness.dark,
  );
}
