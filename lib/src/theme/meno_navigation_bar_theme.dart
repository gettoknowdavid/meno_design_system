import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_navigation_bar_theme}
/// Theme class for Navigation bar
/// {@endtemplate}
class MenoNavigationBarTheme extends ThemeExtension<MenoNavigationBarTheme> {
  /// {@macro meno_navigation_bar_theme}
  const MenoNavigationBarTheme({
    required this.backgroundColor,
    required this.selectedColor,
    required this.borderColor,
    required this.unselectedColor,
    required this.labelTextStyle,
    required this.contentPadding,
    required this.height,
    required this.iconTheme,
  });

  /// {@macro meno_navigation_bar_theme}
  factory MenoNavigationBarTheme.of(BuildContext context) {
    final theme = Theme.of(context).extension<MenoTheme>()!;
    return theme.navigationBarTheme as MenoNavigationBarTheme;
  }

  /// {@macro meno_navigation_bar_theme}
  factory MenoNavigationBarTheme.$default(MenoColorScheme colors) {
    final selectedColor = colors.buttonFill;
    final unselectedColor = colors.labelPlaceholder;

    final iconTheme = IconThemeData(size: 20, color: unselectedColor);
    final style = MenoTextStyles.microMedium.copyWith(color: unselectedColor);

    return MenoNavigationBarTheme(
      backgroundColor: colors.backgroundDefault,
      selectedColor: selectedColor,
      unselectedColor: unselectedColor,
      borderColor: colors.strokeSoft,
      labelTextStyle: Internal.resolveWith(
        style,
        selected: style.copyWith(color: selectedColor),
      ),
      contentPadding: const EdgeInsets.all(Insets.lg),
      height: 104,
      iconTheme: Internal.resolveWith(
        iconTheme,
        selected: iconTheme.copyWith(color: selectedColor),
      ),
    );
  }

  /// Background color of the navigation bar
  final Color backgroundColor;

  /// Selected color
  final Color selectedColor;

  /// Unselected color
  final Color unselectedColor;

  /// Border color
  final Color borderColor;

  /// Label text style
  final WidgetStateProperty<TextStyle?> labelTextStyle;

  /// Content padding
  final EdgeInsetsGeometry contentPadding;

  /// Height
  final double height;

  /// Icon Theme
  final WidgetStateProperty<IconThemeData?> iconTheme;

  @override
  ThemeExtension<MenoNavigationBarTheme> copyWith({
    Color? backgroundColor,
    Color? selectedColor,
    Color? borderColor,
    Color? unselectedColor,
    WidgetStateProperty<TextStyle?>? labelTextStyle,
    EdgeInsetsGeometry? contentPadding,
    double? height,
    WidgetStateProperty<IconThemeData?>? iconTheme,
  }) {
    return MenoNavigationBarTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      selectedColor: selectedColor ?? this.selectedColor,
      borderColor: borderColor ?? this.borderColor,
      unselectedColor: unselectedColor ?? this.unselectedColor,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      contentPadding: contentPadding ?? this.contentPadding,
      height: height ?? this.height,
      iconTheme: iconTheme ?? this.iconTheme,
    );
  }

  @override
  ThemeExtension<MenoNavigationBarTheme> lerp(
    covariant ThemeExtension<MenoNavigationBarTheme>? other,
    double t,
  ) {
    if (other is! MenoNavigationBarTheme) return this;
    return MenoNavigationBarTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      selectedColor: Color.lerp(selectedColor, other.selectedColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      unselectedColor: Color.lerp(unselectedColor, other.unselectedColor, t)!,
      labelTextStyle:
          WidgetStateProperty.lerp<TextStyle?>(
            labelTextStyle,
            other.labelTextStyle,
            t,
            TextStyle.lerp,
          )!,
      contentPadding:
          EdgeInsetsGeometry.lerp(contentPadding, other.contentPadding, t)!,
      height: lerpDouble(height, other.height, t)!,
      iconTheme:
          WidgetStateProperty.lerp<IconThemeData?>(
            iconTheme,
            other.iconTheme,
            t,
            IconThemeData.lerp,
          )!,
    );
  }
}
