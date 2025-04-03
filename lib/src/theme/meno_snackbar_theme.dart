import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_snackbar_theme}
/// Theme class for snackbar
/// {@endtemplate}
class MenoSnackbarTheme extends ThemeExtension<MenoSnackbarTheme> {
  /// {@macro meno_snackbar_theme}
  const MenoSnackbarTheme({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.contentPadding,
    required this.insetPadding,
    required this.textStyle,
    required this.actionTextStyle,
    required this.elevation,
  });

  /// Snackbar theme
  factory MenoSnackbarTheme.of(BuildContext context) {
    final theme = Theme.of(context).extension<MenoTheme>()!;
    return theme.snackbarTheme as MenoSnackbarTheme;
  }

  /// {@macro meno_snackbar_theme}
  factory MenoSnackbarTheme.$default(MenoColorScheme colors) {
    final isLight = colors.brightness == Brightness.light;
    return MenoSnackbarTheme(
      backgroundColor: Internal.resolve(
        isLight,
        MenoColors.violet.shade500,
        colors.brandPrimary,
      ),
      foregroundColor: Internal.resolve(
        isLight,
        MenoColors.neutral[0]!,
        colors.buttonLabelPrimary,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: Insets.md,
        vertical: Insets.lg,
      ),
      insetPadding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      textStyle: MenoTextStyles.captionRegular,
      actionTextStyle: MenoTextStyles.microMedium,
      elevation: 6,
    );
  }

  /// Background Color
  final Color backgroundColor;

  /// Foreground Color
  final Color foregroundColor;

  /// Content Padding
  final EdgeInsetsGeometry contentPadding;

  /// Inset Padding
  final EdgeInsets insetPadding;

  /// TextStyle  of the content
  final TextStyle textStyle;

  /// TextStyle of the action
  final TextStyle actionTextStyle;

  /// Elevation
  final double elevation;

  @override
  ThemeExtension<MenoSnackbarTheme> copyWith({
    Color? backgroundColor,
    Color? foregroundColor,
    EdgeInsetsGeometry? contentPadding,
    EdgeInsets? insetPadding,
    TextStyle? textStyle,
    TextStyle? actionTextStyle,
    double? elevation,
  }) {
    return MenoSnackbarTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      contentPadding: contentPadding ?? this.contentPadding,
      insetPadding: insetPadding ?? this.insetPadding,
      textStyle: textStyle ?? this.textStyle,
      actionTextStyle: actionTextStyle ?? this.actionTextStyle,
      elevation: elevation ?? this.elevation,
    );
  }

  @override
  ThemeExtension<MenoSnackbarTheme> lerp(
    covariant ThemeExtension<MenoSnackbarTheme>? other,
    double t,
  ) {
    if (other is! MenoSnackbarTheme) return this;
    return MenoSnackbarTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t)!,
      contentPadding:
          EdgeInsetsGeometry.lerp(contentPadding, other.contentPadding, t)!,
      insetPadding: EdgeInsets.lerp(insetPadding, other.insetPadding, t)!,
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      actionTextStyle:
          TextStyle.lerp(actionTextStyle, other.actionTextStyle, t)!,
      elevation: lerpDouble(elevation, other.elevation, t)!,
    );
  }
}
