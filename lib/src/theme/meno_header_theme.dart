import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_header_theme}
/// Meno Header Theme
/// {@endtemplate}
class MenoHeaderTheme extends ThemeExtension<MenoHeaderTheme> {
  /// {@macro meno_header_theme}
  const MenoHeaderTheme({required this.primary, required this.secondary});

  /// {@macro meno_header_theme}
  factory MenoHeaderTheme.$default(
    MenoColorScheme colors,
    MenoTextTheme textTheme,
  ) {
    return MenoHeaderTheme(
      primary: HeaderStyle(
        titleTextStyle: textTheme.subheadingMedium,
        labelTextStyle: textTheme.captionRegular,
        actionLabelTextStyle: textTheme.microMedium,
        titleEndGap: Insets.sm,
        backgroundColor: colors.backgroundDefault,
        foregroundColor: colors.labelPrimary,
        showSideBorder: false,
        sideBorderThickness: 4,
        titleStartGap: 0,
        actionsSpacing: 24,
        padding: const EdgeInsets.symmetric(horizontal: Insets.lg, vertical: 6),
      ),
      secondary: HeaderStyle(
        titleTextStyle: textTheme.heading3Bold,
        actionLabelTextStyle: textTheme.microMedium,
        titleEndGap: 14,
        backgroundColor: colors.backgroundDefault,
        foregroundColor: colors.labelPrimary,
        showSideBorder: true,
        sideBorderThickness: 4,
        sideBorderColor: colors.brandSecondary,
        titleStartGap: 4,
        actionsSpacing: 24,
        padding: const EdgeInsets.symmetric(horizontal: Insets.lg),
      ),
    );
  }

  /// {@macro meno_header_theme}
  factory MenoHeaderTheme.of(BuildContext context) {
    final theme = Theme.of(context).extension<MenoTheme>()!;
    return theme.headerTheme as MenoHeaderTheme;
  }

  /// Primary header styles
  final HeaderStyle primary;

  /// Secondart header styles
  final HeaderStyle secondary;

  @override
  ThemeExtension<MenoHeaderTheme> copyWith({
    HeaderStyle? primary,
    HeaderStyle? secondary,
  }) {
    return MenoHeaderTheme(
      primary: primary ?? this.primary,
      secondary: primary ?? this.secondary,
    );
  }

  @override
  ThemeExtension<MenoHeaderTheme> lerp(
    covariant ThemeExtension<MenoHeaderTheme>? other,
    double t,
  ) {
    if (other is! MenoHeaderTheme) return this;
    return MenoHeaderTheme(
      primary: HeaderStyle.lerp(primary, other.primary, t)!,
      secondary: HeaderStyle.lerp(secondary, other.secondary, t)!,
    );
  }
}
