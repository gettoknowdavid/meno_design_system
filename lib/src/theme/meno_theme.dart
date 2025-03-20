import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_theme}
/// Configuration class which collects all Themes of app together and provides
/// them as a single instance
/// {@endtemplate}
class MenoTheme extends ThemeExtension<MenoTheme> {
  /// {@macro meno_theme}
  const MenoTheme({
    required this.colors,
    required this.textTheme,
    required this.buttonTheme,
    required this.inputTheme,
  });

  /// Retrieves the [MenoTheme] extension from the closest [Theme] instance
  /// that encloses the given [context].
  ///
  /// This method searches for the nearest [Theme] widget in the widget tree
  /// and returns the [MenoTheme] extension if it exists. If no
  /// [MenoTheme] extension is found, this method returns null.
  ///
  /// The [MenoTheme] extension must be added to the [ThemeData.extensions]
  /// in your theme configuration to be accessible using this method.
  ///
  /// Example usage:
  /// ```dart
  /// final MenoTheme = MenoTheme.of(context);
  /// ```
  ///
  /// - [context]: The build context from which to retrieve the [MenoTheme]
  /// extension.
  ///
  /// Returns the [MenoTheme] extension if found, or null if no
  /// [MenoTheme] extension is available in the closest [Theme] instance.
  factory MenoTheme.of(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final defaultTheme = MenoTheme.$default(brightness);
    return Theme.of(context).extension<MenoTheme>() ?? defaultTheme;
  }

  /// {@macro meno_theme}
  factory MenoTheme.$default(Brightness brightness) {
    final colors = MenoColorScheme.$default(brightness);
    final textTheme = MenoTextTheme.$default(colors);
    final buttonTheme = MenoButtonTheme.$default(colors);
    final inputTheme = MenoInputTheme.$default(colors, textTheme);

    return MenoTheme(
      colors: colors,
      textTheme: textTheme,
      buttonTheme: buttonTheme,
      inputTheme: inputTheme,
    );
  }

  /// Retrieves the light [ThemeData]
  static ThemeData get light => _raw(Brightness.light);

  /// Retrieves the dark [ThemeData]
  static ThemeData get dark => _raw(Brightness.dark);

  /// {@macro meno_theme}
  static ThemeData _raw(Brightness brightness) {
    final colors = MenoColorScheme.$default(brightness);
    final themeExtension = MenoTheme.$default(brightness);

    return ThemeData(
      colorScheme: colors.materialColorScheme,
      extensions: [
        themeExtension,
        themeExtension.buttonTheme,
        themeExtension.colors,
        themeExtension.textTheme,
        themeExtension.inputTheme,
      ],
    );
  }

  @override
  ThemeExtension<MenoTheme> copyWith({
    ThemeExtension<MenoColorScheme>? colors,
    ThemeExtension<MenoTextTheme>? textTheme,
    ThemeExtension<MenoButtonTheme>? buttonTheme,
    ThemeExtension<MenoInputTheme>? inputTheme,
  }) {
    return MenoTheme(
      colors: colors ?? this.colors,
      textTheme: textTheme ?? this.textTheme,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      inputTheme: inputTheme ?? this.inputTheme,
    );
  }

  /// [MenoColorScheme] instance provides configuration of [ColorScheme]
  final ThemeExtension<MenoColorScheme> colors;

  /// [MenoTextTheme] instance provides configuration of [TextTheme]
  final ThemeExtension<MenoTextTheme> textTheme;

  /// [MenoButtonTheme] instance provides configuration of [TextTheme]
  final ThemeExtension<MenoButtonTheme> buttonTheme;

  /// [MenoInputTheme] instance provides configuration of [TextTheme]
  final ThemeExtension<MenoInputTheme> inputTheme;

  @override
  ThemeExtension<MenoTheme> lerp(
    covariant ThemeExtension<MenoTheme>? other,
    double t,
  ) {
    if (other is! MenoTheme) return this;
    return MenoTheme(
      colors: colors.lerp(other.colors, t),
      textTheme: textTheme.lerp(other.textTheme, t),
      buttonTheme: buttonTheme.lerp(other.buttonTheme, t),
      inputTheme: inputTheme.lerp(other.inputTheme, t),
    );
  }
}
