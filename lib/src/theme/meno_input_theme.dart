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
    required this.counterTextStyle,
    required this.validationTextStyle,
    required this.defaultColor,
    required this.activeColor,
    required this.errorColor,
    required this.focusedColor,
    required this.focusedLabelColor,
    required this.disabledColor,
    required this.fillColor,
    required this.cursorColor,
    required this.iconColor,
    required this.counterFocusedColor,
    required this.counterDisabledColor,
    required this.counterContainerFocusedColor,
    required this.counterContainerDisabledColor,
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
      activeColor: colors.labelPrimary,
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
      counterTextStyle: textTheme.microMedium,
      counterFocusedColor: colors.brandPrimary,
      counterDisabledColor: colors.labelHelp,
      counterContainerFocusedColor: colors.brandPrimaryLighter,
      counterContainerDisabledColor: colors.componentPrimary,
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

  /// Active color of the [MenoTextfield]
  final Color activeColor;

  /// Color of the [MenoTextfield] container
  final Color fillColor;

  /// Color of the [MenoTextfield] cursor
  final Color cursorColor;

  /// Color of the [MenoTextfield]'s `prefixIcon` and `suffixIcon`
  final Color iconColor;

  /// TextStyle for input counter
  final TextStyle counterTextStyle;

  /// Color for the input counter when focused
  final Color counterFocusedColor;

  /// Color for the input counter when disabled
  final Color counterDisabledColor;

  /// Color for the input counter container when focused
  final Color counterContainerFocusedColor;

  /// Color for the input counter container when disabled
  final Color counterContainerDisabledColor;

  @override
  ThemeExtension<MenoInputTheme> copyWith({
    TextStyle? textStyle,
    TextStyle? labelTextStyle,
    TextStyle? errorTextStyle,
    TextStyle? validationTextStyle,
    TextStyle? counterTextStyle,
    Color? defaultColor,
    Color? activeColor,
    Color? errorColor,
    Color? focusedColor,
    Color? focusedLabelColor,
    Color? disabledColor,
    Color? fillColor,
    Color? cursorColor,
    Color? iconColor,
    Color? counterFocusedColor,
    Color? counterDisabledColor,
    Color? counterContainerFocusedColor,
    Color? counterContainerDisabledColor,
  }) {
    return MenoInputTheme(
      textStyle: textStyle ?? this.textStyle,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      errorTextStyle: errorTextStyle ?? this.errorTextStyle,
      counterTextStyle: counterTextStyle ?? this.counterTextStyle,
      validationTextStyle: validationTextStyle ?? this.validationTextStyle,
      defaultColor: defaultColor ?? this.defaultColor,
      activeColor: activeColor ?? this.activeColor,
      errorColor: errorColor ?? this.errorColor,
      focusedColor: focusedColor ?? this.focusedColor,
      focusedLabelColor: focusedLabelColor ?? this.focusedLabelColor,
      disabledColor: disabledColor ?? this.disabledColor,
      fillColor: fillColor ?? this.fillColor,
      cursorColor: cursorColor ?? this.cursorColor,
      iconColor: iconColor ?? this.iconColor,
      counterFocusedColor: counterFocusedColor ?? this.counterFocusedColor,
      counterDisabledColor: counterDisabledColor ?? this.counterDisabledColor,
      counterContainerFocusedColor:
          counterContainerFocusedColor ?? this.counterContainerFocusedColor,
      counterContainerDisabledColor:
          counterContainerDisabledColor ?? this.counterContainerDisabledColor,
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
      counterTextStyle:
          TextStyle.lerp(counterTextStyle, other.counterTextStyle, t)!,
      validationTextStyle:
          TextStyle.lerp(validationTextStyle, other.validationTextStyle, t)!,
      defaultColor: Color.lerp(defaultColor, other.defaultColor, t)!,
      activeColor: Color.lerp(activeColor, other.activeColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      focusedColor: Color.lerp(focusedColor, other.focusedColor, t)!,
      focusedLabelColor:
          Color.lerp(focusedLabelColor, other.focusedLabelColor, t)!,
      disabledColor: Color.lerp(disabledColor, other.disabledColor, t)!,
      fillColor: Color.lerp(fillColor, other.fillColor, t)!,
      cursorColor: Color.lerp(cursorColor, other.cursorColor, t)!,
      iconColor: Color.lerp(iconColor, other.iconColor, t)!,
      counterFocusedColor:
          Color.lerp(counterFocusedColor, other.counterFocusedColor, t)!,
      counterDisabledColor:
          Color.lerp(counterDisabledColor, other.counterDisabledColor, t)!,
      counterContainerFocusedColor:
          Color.lerp(
            counterContainerFocusedColor,
            other.counterContainerFocusedColor,
            t,
          )!,
      counterContainerDisabledColor:
          Color.lerp(
            counterContainerDisabledColor,
            other.counterContainerDisabledColor,
            t,
          )!,
    );
  }
}
