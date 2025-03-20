import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_input_theme}
/// Theme class which provides configuration of buttons
/// {@endtemplate}
class MenoInputTheme extends ThemeExtension<MenoInputTheme> {
  /// {@macro meno_input_theme}
  const MenoInputTheme({
    required this.textStyle,
    required this.labelTextStyle,
    required this.errorTextStyle,
    required this.validationTextStyle,
    required this.defaultBorderColor,
    required this.errorBorderColor,
    required this.focusedBorderColor,
    required this.disabledBorderColor,
    required this.fillColor,
    required this.cursorColor,
  });

  /// {@macro meno_input_theme}
  factory MenoInputTheme.$default(
    MenoColorScheme colors,
    MenoTextTheme textTheme,
  ) {
    final baseTextStyle = textTheme.captionRegular;
    return MenoInputTheme(
      textStyle: WidgetStateTextStyle.resolveWith((states) {
        late Color color;
        if (states.contains(WidgetState.disabled)) {
          color = colors.labelDisabled;
        } else if (states.contains(WidgetState.focused)) {
          color = colors.labelPrimary;
        } else if (states.contains(WidgetState.error)) {
          color = colors.labelPrimary;
        } else {
          color = colors.labelPlaceholder;
        }
        return baseTextStyle.copyWith(color: color);
      }),
      labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
        late Color color;
        if (states.contains(WidgetState.disabled)) {
          color = colors.labelDisabled;
        } else if (states.contains(WidgetState.focused)) {
          color = colors.labelPrimary;
        } else if (states.contains(WidgetState.error)) {
          color = colors.errorBase;
        } else {
          color = colors.labelPlaceholder;
        }
        return baseTextStyle.copyWith(color: color);
      }),
      errorTextStyle: baseTextStyle.copyWith(color: colors.errorBase),
      validationTextStyle: WidgetStateTextStyle.resolveWith((states) {
        late Color color;
        if (states.contains(WidgetState.disabled)) {
          color = colors.labelDisabled;
        } else if (states.contains(WidgetState.error)) {
          color = colors.errorBase;
        } else {
          color = colors.labelHelp;
        }
        return baseTextStyle.copyWith(color: color);
      }),
      defaultBorderColor: colors.strokeSoft,
      disabledBorderColor: colors.disabledLight,
      errorBorderColor: colors.errorBase,
      focusedBorderColor: colors.brandPrimary,
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.disabledLight;
        }
        return Colors.transparent;
      }),
      cursorColor: colors.strokeStrong,
    );
  }

  /// {@macro meno_input_theme}
  factory MenoInputTheme.of(BuildContext context) {
    final theme = Theme.of(context).extension<MenoTheme>()!;
    return theme.inputTheme as MenoInputTheme;
  }

  /// Main [TextStyle] of the text input field
  final TextStyle textStyle;

  /// Label [TextStyle] of the text input field
  final TextStyle labelTextStyle;

  /// Error [TextStyle] of the text input field
  final TextStyle errorTextStyle;

  /// Validation [TextStyle] of the text input field
  final TextStyle validationTextStyle;

  /// Default border color of the [MenoTextfield]
  final Color defaultBorderColor;

  /// Error border color of the [MenoTextfield]
  final Color errorBorderColor;

  /// Focused border color of the [MenoTextfield]
  final Color focusedBorderColor;

  /// Disabled border color of the [MenoTextfield]
  final Color disabledBorderColor;

  /// Color of the [MenoTextfield] container
  final Color fillColor;

  /// Color of the [MenoTextfield] cursor
  final Color cursorColor;

  @override
  ThemeExtension<MenoInputTheme> copyWith({
    TextStyle? textStyle,
    TextStyle? labelTextStyle,
    TextStyle? errorTextStyle,
    TextStyle? validationTextStyle,
    Color? defaultBorderColor,
    Color? errorBorderColor,
    Color? focusedBorderColor,
    Color? disabledBorderColor,
    Color? fillColor,
    Color? cursorColor,
  }) {
    return MenoInputTheme(
      textStyle: textStyle ?? this.textStyle,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      errorTextStyle: errorTextStyle ?? this.errorTextStyle,
      validationTextStyle: validationTextStyle ?? this.validationTextStyle,
      defaultBorderColor: defaultBorderColor ?? this.defaultBorderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      focusedBorderColor: focusedBorderColor ?? this.focusedBorderColor,
      disabledBorderColor: disabledBorderColor ?? this.disabledBorderColor,
      fillColor: fillColor ?? this.fillColor,
      cursorColor: cursorColor ?? this.cursorColor,
    );
  }

  @override
  ThemeExtension<MenoInputTheme> lerp(
    covariant ThemeExtension<MenoInputTheme>? other,
    double t,
  ) {
    if (other is! MenoInputTheme) return this;
    return MenoInputTheme(
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      labelTextStyle: TextStyle.lerp(labelTextStyle, other.labelTextStyle, t)!,
      errorTextStyle: TextStyle.lerp(errorTextStyle, other.errorTextStyle, t)!,
      validationTextStyle:
          TextStyle.lerp(validationTextStyle, other.validationTextStyle, t)!,
      defaultBorderColor:
          Color.lerp(defaultBorderColor, other.defaultBorderColor, t)!,
      errorBorderColor:
          Color.lerp(errorBorderColor, other.errorBorderColor, t)!,
      focusedBorderColor:
          Color.lerp(focusedBorderColor, other.focusedBorderColor, t)!,
      disabledBorderColor:
          Color.lerp(disabledBorderColor, other.disabledBorderColor, t)!,
      fillColor: Color.lerp(fillColor, other.fillColor, t)!,
      cursorColor: Color.lerp(cursorColor, other.cursorColor, t)!,
    );
  }
}
