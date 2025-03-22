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
    required this.defaultColor,
    required this.errorColor,
    required this.focusedColor,
    required this.focusedLabelColor,
    required this.disabledColor,
    required this.fillColor,
    required this.cursorColor,
    required this.iconColor,
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
      labelTextStyle: textTheme.captionMedium,
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
      defaultColor: colors.strokeSoft,
      disabledColor: colors.disabledLight,
      errorColor: colors.errorBase,
      focusedColor: colors.brandPrimary,
      focusedLabelColor: colors.labelPrimary,
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.disabledLight;
        }
        return Colors.transparent;
      }),
      cursorColor: colors.strokeStrong,
      iconColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.disabledBase;
        } else if (states.contains(WidgetState.error)) {
          return colors.labelPrimary;
        } else if (states.contains(WidgetState.focused)) {
          return colors.labelPrimary;
        }
        return colors.labelPlaceholder;
      }),
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
  final Color defaultColor;

  /// Error border color of the [MenoTextfield]
  final Color errorColor;

  /// Focused border color of the [MenoTextfield]
  final Color focusedColor;

  /// Focused border color of the [MenoTextfield]
  final Color focusedLabelColor;

  /// Disabled border color of the [MenoTextfield]
  final Color disabledColor;

  /// Color of the [MenoTextfield] container
  final Color fillColor;

  /// Color of the [MenoTextfield] cursor
  final Color cursorColor;

  /// Color of the [MenoTextfield]'s `prefixIcon` and `suffixIcon`
  final Color iconColor;

  @override
  ThemeExtension<MenoInputTheme> copyWith({
    TextStyle? textStyle,
    TextStyle? labelTextStyle,
    TextStyle? errorTextStyle,
    TextStyle? validationTextStyle,
    Color? defaultColor,
    Color? errorColor,
    Color? focusedColor,
    Color? focusedLabelColor,
    Color? disabledColor,
    Color? fillColor,
    Color? cursorColor,
    Color? iconColor,
  }) {
    return MenoInputTheme(
      textStyle: textStyle ?? this.textStyle,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      errorTextStyle: errorTextStyle ?? this.errorTextStyle,
      validationTextStyle: validationTextStyle ?? this.validationTextStyle,
      defaultColor: defaultColor ?? this.defaultColor,
      errorColor: errorColor ?? this.errorColor,
      focusedColor: focusedColor ?? this.focusedColor,
      focusedLabelColor: focusedLabelColor ?? this.focusedLabelColor,
      disabledColor: disabledColor ?? this.disabledColor,
      fillColor: fillColor ?? this.fillColor,
      cursorColor: cursorColor ?? this.cursorColor,
      iconColor: iconColor ?? this.iconColor,
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
      defaultColor: Color.lerp(defaultColor, other.defaultColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      focusedColor: Color.lerp(focusedColor, other.focusedColor, t)!,
      focusedLabelColor:
          Color.lerp(focusedLabelColor, other.focusedLabelColor, t)!,
      disabledColor: Color.lerp(disabledColor, other.disabledColor, t)!,
      fillColor: Color.lerp(fillColor, other.fillColor, t)!,
      cursorColor: Color.lerp(cursorColor, other.cursorColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
    );
  }
}
