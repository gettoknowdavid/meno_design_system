import 'package:flutter/material.dart';

/// Provides helper functions for design system
class Internal {
  /// Resolves the appropriate value based on the theme brightness.
  ///
  /// This method selects either the light theme value or the dark theme value
  /// based on whether the theme brightness is light or dark.
  ///
  /// - [isLight]: A boolean indicating if the theme is light.
  /// - [lightThemeValue]: The value to use for light themes.
  /// - [darkThemeValue]: The value to use for dark themes.
  ///
  /// Returns the appropriate value for the current theme brightness.
  static T resolve<T>(bool isLight, T lightThemeValue, T darkThemeValue) {
    return isLight ? lightThemeValue : darkThemeValue;
  }

  /// Convenience method for easier use of [WidgetStateProperty.all].
  static WidgetStateProperty<T> all<T>(T value) {
    return WidgetStateProperty.all(value);
  }

  /// Convenience method for easier use of [WidgetStateProperty.resolveWith].
  static WidgetStateProperty<T?> resolveWith<T>(
    T defaultValue, {
    T? pressed,
    T? disabled,
    T? hovered,
    T? selected,
  }) {
    return WidgetStateProperty.resolveWith((states) {
      // disabled
      if (states.contains(WidgetState.disabled) && disabled != null) {
        return disabled;
      }

      // pressed / focused
      if (states.any({WidgetState.pressed, WidgetState.focused}.contains) &&
          pressed != null) {
        return pressed;
      }
      // hovered
      if (states.contains(WidgetState.hovered) && hovered != null) {
        return hovered;
      }

      // selected
      if (states.contains(WidgetState.selected) && selected != null) {
        return selected;
      }
      // default
      return defaultValue;
    });
  }
}
