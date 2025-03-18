import 'package:flutter/material.dart';
import 'package:meno_design_system/src/core/colors/meno_color_scheme.dart';
import 'package:meno_design_system/src/core/typography/meno_text_theme.dart';

/// {@template meno_theme}
/// Configuration class which collects all Themes of app together and provides
/// them as a single instance
/// {@endtemplate}
class MenoTheme extends ThemeExtension<MenoTheme> {
  /// {@macro meno_theme}
  const MenoTheme({required this.colors, required this.textTheme});

  /// Private method to generate raw theme data based on brightness.
  static ThemeData get light {
    final colors = MenoColorScheme.light();
    final colorScheme = colors.lightMaterialColorScheme;
    final textTheme = MenoTextTheme.$default(colorScheme);
    final themeExtension = MenoTheme(colors: colors, textTheme: textTheme);
    return ThemeData(
      colorScheme: colors.lightMaterialColorScheme,
      extensions: [themeExtension],
    );
  }

  /// Retrieves the dark [ThemeData]
  static ThemeData get dark {
    final colors = MenoColorScheme.dark();
    final colorScheme = colors.darkMaterialColorScheme;
    final textTheme = MenoTextTheme.$default(colorScheme);
    final themeExtension = MenoTheme(colors: colors, textTheme: textTheme);
    return ThemeData(
      colorScheme: colors.darkMaterialColorScheme,
      extensions: [themeExtension],
    );
  }

  @override
  ThemeExtension<MenoTheme> copyWith({
    ThemeExtension<MenoColorScheme>? colors,
    ThemeExtension<MenoTextTheme>? textTheme,
  }) {
    return MenoTheme(
      colors: colors ?? this.colors,
      textTheme: textTheme ?? this.textTheme,
    );
  }

  /// [MenoColorScheme] instance provides configuration of [ColorScheme]
  final ThemeExtension<MenoColorScheme> colors;

  /// [MenoTextTheme] instance provides configuration of [TextTheme]
  final ThemeExtension<MenoTextTheme> textTheme;

  @override
  ThemeExtension<MenoTheme> lerp(
    covariant ThemeExtension<MenoTheme>? other,
    double t,
  ) {
    if (other is! MenoTheme) return this;
    return MenoTheme(
      colors: colors.lerp(other.colors, t),
      textTheme: textTheme.lerp(other.textTheme, t),
    );
  }
}
