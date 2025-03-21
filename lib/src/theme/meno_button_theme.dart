import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_button_theme}
/// Theme class which provides configuration of buttons
/// {@endtemplate}
class MenoButtonTheme extends ThemeExtension<MenoButtonTheme> {
  /// {@macro meno_button_theme}
  const MenoButtonTheme({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.success,
    required this.danger,
    required this.dangerLighter,
    required this.outlined,
    required this.white,
  });

  /// {@macro meno_button_theme}
  factory MenoButtonTheme.$default(MenoColorScheme colors) {
    const side = BorderSide(width: 1.5);
    return MenoButtonTheme(
      primary: ButtonStyle(
        foregroundColor: Internal.resolveWith(
          colors.buttonLabelPrimary,
          disabled: colors.labelDisabled,
        ),
        backgroundColor: Internal.resolveWith(
          colors.brandPrimary,
          disabled: colors.disabledLight,
          pressed: colors.brandPrimary.withValues(alpha: 0.4),
          hovered: colors.brandPrimary.withValues(alpha: 0.4),
        ),
        elevation: Internal.resolveWith(0, disabled: 4, hovered: 1),
        overlayColor: Internal.resolveWith(
          colors.brandPrimary,
          pressed: colors.brandPrimary.withValues(alpha: 0.4),
          hovered: colors.brandPrimary.withValues(alpha: 0.4),
          focused: colors.brandPrimary.withValues(alpha: 0.4),
        ),
        shadowColor: WidgetStatePropertyAll<Color>(colors.shadow),
        minimumSize: Internal.all(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        mouseCursor: Internal.resolveWith(
          SystemMouseCursors.click,
          disabled: SystemMouseCursors.basic,
        ),
        iconColor: Internal.resolveWith(
          colors.buttonLabelPrimary,
          disabled: colors.labelDisabled,
        ),
      ),
      secondary: ButtonStyle(
        foregroundColor: Internal.resolveWith(
          colors.buttonLabelSecondary,
          pressed: colors.buttonLabelSecondary.withValues(alpha: 0.4),
        ),
        side: Internal.resolveWith(
          side.copyWith(color: colors.buttonFill),
          pressed: side.copyWith(
            color: colors.buttonFill.withValues(alpha: 0.4),
          ),
        ),
        mouseCursor: Internal.resolveWith(
          SystemMouseCursors.click,
          disabled: SystemMouseCursors.basic,
        ),
        iconColor: Internal.resolveWith(
          colors.buttonLabelSecondary,
          pressed: colors.buttonLabelSecondary.withValues(alpha: 0.4),
        ),
        overlayColor: Internal.resolveWith(
          Colors.transparent,
          pressed: colors.brandPrimary.withValues(alpha: 0.1),
          hovered: colors.brandPrimary.withValues(alpha: 0.08),
          focused: colors.brandPrimary.withValues(alpha: 0.1),
        ),
        minimumSize: Internal.all(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        elevation: Internal.resolveWith(0),
        shadowColor: Internal.all(Colors.transparent),
      ),
      tertiary: ButtonStyle(
        foregroundColor: Internal.resolveWith(
          colors.buttonLabelSecondary,
          pressed: colors.buttonLabelSecondary.withValues(alpha: 0.4),
        ),
        overlayColor: Internal.resolveWith(Colors.transparent),
        minimumSize: Internal.all(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        surfaceTintColor: Internal.all(Colors.transparent),
        shadowColor: Internal.all(Colors.transparent),
        elevation: Internal.resolveWith(0),
        mouseCursor: Internal.resolveWith(
          SystemMouseCursors.click,
          disabled: SystemMouseCursors.basic,
        ),
      ),
      success: ButtonStyle(
        foregroundColor: Internal.resolveWith(colors.staticWhite),
        backgroundColor: Internal.resolveWith(
          colors.successBase,
          pressed: colors.successBase.withValues(alpha: 0.4),
          hovered: colors.successBase.withValues(alpha: 0.4),
        ),
        elevation: Internal.resolveWith(0, disabled: 4),
        overlayColor: Internal.resolveWith(
          colors.successBase,
          pressed: colors.successBase.withValues(alpha: 0.4),
          hovered: colors.successBase.withValues(alpha: 0.4),
          focused: colors.successBase.withValues(alpha: 0.4),
        ),
        shadowColor: WidgetStatePropertyAll<Color>(colors.shadow),
        minimumSize: Internal.all(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        mouseCursor: Internal.resolveWith(
          SystemMouseCursors.click,
          disabled: SystemMouseCursors.basic,
        ),
      ),
      danger: ButtonStyle(
        foregroundColor: Internal.resolveWith(colors.staticWhite),
        backgroundColor: Internal.resolveWith(
          colors.errorBase,
          pressed: colors.errorBase.withValues(alpha: 0.4),
          hovered: colors.errorBase.withValues(alpha: 0.4),
        ),
        elevation: Internal.resolveWith(0, disabled: 4),
        overlayColor: Internal.resolveWith(
          colors.errorBase,
          pressed: colors.errorBase.withValues(alpha: 0.4),
          hovered: colors.errorBase.withValues(alpha: 0.4),
          focused: colors.errorBase.withValues(alpha: 0.4),
        ),
        shadowColor: WidgetStatePropertyAll<Color>(colors.shadow),
        minimumSize: Internal.all(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        mouseCursor: Internal.resolveWith(
          SystemMouseCursors.click,
          disabled: SystemMouseCursors.basic,
        ),
      ),
      dangerLighter: ButtonStyle(
        foregroundColor: Internal.resolveWith(colors.errorDark),
        backgroundColor: Internal.resolveWith(
          colors.errorLighter,
          pressed: colors.errorLighter.withValues(alpha: 0.4),
        ),
        elevation: Internal.resolveWith(0, disabled: 4),
        overlayColor: Internal.resolveWith(
          colors.errorLighter,
          pressed: colors.errorLighter.withValues(alpha: 0.4),
          hovered: colors.errorLighter.withValues(alpha: 0.4),
          focused: colors.errorLighter.withValues(alpha: 0.4),
        ),
        shadowColor: WidgetStatePropertyAll<Color>(colors.shadow),
        minimumSize: Internal.all(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        mouseCursor: Internal.resolveWith(
          SystemMouseCursors.click,
          disabled: SystemMouseCursors.basic,
        ),
      ),
      outlined: ButtonStyle(
        foregroundColor: Internal.resolveWith(
          colors.labelPrimary,
          pressed: colors.labelPrimary.withValues(alpha: 0.4),
        ),
        side: Internal.resolveWith(
          side.copyWith(color: colors.strokeSoft),
          pressed: side.copyWith(
            color: colors.strokeSoft.withValues(alpha: 0.4),
          ),
        ),
        mouseCursor: Internal.resolveWith(
          SystemMouseCursors.click,
          disabled: SystemMouseCursors.basic,
        ),
        overlayColor: Internal.resolveWith(Colors.transparent),
        minimumSize: Internal.all(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        elevation: Internal.resolveWith(0),
        shadowColor: Internal.all(Colors.transparent),
      ),
      white: ButtonStyle(
        foregroundColor: Internal.resolveWith(colors.staticBlack),
        backgroundColor: Internal.resolveWith(
          colors.staticWhite,
          pressed: colors.staticWhite.withValues(alpha: 0.4),
          hovered: colors.staticWhite.withValues(alpha: 0.4),
        ),
        elevation: Internal.resolveWith(0, disabled: 4),
        overlayColor: Internal.resolveWith(
          colors.staticWhite,
          pressed: colors.staticWhite.withValues(alpha: 0.4),
          hovered: colors.staticWhite.withValues(alpha: 0.4),
          focused: colors.staticWhite.withValues(alpha: 0.4),
        ),
        shadowColor: WidgetStatePropertyAll<Color>(colors.shadow),
        minimumSize: Internal.all(Size.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        mouseCursor: Internal.resolveWith(
          SystemMouseCursors.click,
          disabled: SystemMouseCursors.basic,
        ),
      ),
    );
  }

  /// {@macro meno_button_theme}
  factory MenoButtonTheme.of(BuildContext context) {
    final theme = Theme.of(context).extension<MenoTheme>()!;
    return theme.buttonTheme as MenoButtonTheme;
  }

  /// Primary button styles
  final ButtonStyle primary;

  /// Secondary button styles
  final ButtonStyle secondary;

  /// Tertiary button styles
  final ButtonStyle tertiary;

  /// Success button styles
  final ButtonStyle success;

  /// Danger button styles
  final ButtonStyle danger;

  /// Danger button styles
  final ButtonStyle dangerLighter;

  /// Outlined button styles
  final ButtonStyle outlined;

  /// White button styles
  final ButtonStyle white;

  @override
  ThemeExtension<MenoButtonTheme> copyWith({
    ButtonStyle? primary,
    ButtonStyle? secondary,
    ButtonStyle? tertiary,
    ButtonStyle? success,
    ButtonStyle? danger,
    ButtonStyle? dangerLighter,
    ButtonStyle? outlined,
    ButtonStyle? white,
  }) {
    return MenoButtonTheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      success: success ?? this.success,
      danger: danger ?? this.danger,
      dangerLighter: dangerLighter ?? this.dangerLighter,
      outlined: outlined ?? this.outlined,
      white: white ?? this.white,
    );
  }

  @override
  ThemeExtension<MenoButtonTheme> lerp(
    covariant ThemeExtension<MenoButtonTheme>? other,
    double t,
  ) {
    if (other is! MenoButtonTheme) return this;
    return MenoButtonTheme(
      primary: ButtonStyle.lerp(primary, other.primary, t)!,
      secondary: ButtonStyle.lerp(secondary, other.secondary, t)!,
      tertiary: ButtonStyle.lerp(tertiary, other.tertiary, t)!,
      success: ButtonStyle.lerp(success, other.success, t)!,
      danger: ButtonStyle.lerp(danger, other.danger, t)!,
      dangerLighter: ButtonStyle.lerp(dangerLighter, other.dangerLighter, t)!,
      outlined: ButtonStyle.lerp(outlined, other.outlined, t)!,
      white: ButtonStyle.lerp(white, other.white, t)!,
    );
  }
}
