import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:meno_design_system/src/theme/styles/top_bar_style.dart';

/// {@template meno_top_bar_theme}
/// The theme for the [MenoTopBar]
/// {@endtemplate}
class MenoTopBarTheme extends ThemeExtension<MenoTopBarTheme> {
  /// {@macro meno_top_bar_theme}
  const MenoTopBarTheme({required this.primary, required this.secondary});

  /// Default configurations for the [MenoTopBarTheme]
  factory MenoTopBarTheme.$default(
    MenoColorScheme colors,
    MenoTextTheme textTheme,
  ) {
    final isLight = colors.brightness == Brightness.light;
    return MenoTopBarTheme(
      primary: TopBarStyle(
        topbarHeight: 120,
        backgroundColor: Internal.resolve(
          isLight,
          colors.brandPrimary,
          colors.backgroundDefault,
        ),
        accentColor: colors.brandSecondary,
        textStyle: textTheme.heading2Bold,
        titleColor: Internal.resolve(
          isLight,
          colors.buttonLabelPrimary,
          colors.labelPrimary,
        ),
        leadingTextStyle: textTheme.captionMedium,
        leadingColor: Internal.resolve(
          isLight,
          colors.buttonLabelPrimary,
          colors.labelPrimary,
        ),
      ),
      secondary: TopBarStyle(
        topbarHeight: 56,
        backgroundColor: colors.backgroundDefault,
        textStyle: textTheme.bodyMedium,
        titleColor: colors.labelPrimary,
        actionColor: colors.buttonLabelSecondary,
        leadingColor: colors.buttonLabelSecondary,
        bottomBorder: Border(bottom: BorderSide(color: colors.strokeWeak)),
      ),
    );
  }

  /// {@macro meno_text_theme}
  factory MenoTopBarTheme.of(BuildContext context) {
    final theme = Theme.of(context).extension<MenoTheme>()!;
    return theme.topBarTheme as MenoTopBarTheme;
  }

  /// Primary [TopBarStyle]s
  final TopBarStyle primary;

  /// Secondary [TopBarStyle]s
  final TopBarStyle secondary;

  @override
  ThemeExtension<MenoTopBarTheme> copyWith({
    TopBarStyle? primary,
    TopBarStyle? secondary,
  }) {
    return MenoTopBarTheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
    );
  }

  @override
  ThemeExtension<MenoTopBarTheme> lerp(
    covariant ThemeExtension<MenoTopBarTheme>? other,
    double t,
  ) {
    if (other is! MenoTopBarTheme) return this;
    return MenoTopBarTheme(
      primary: TopBarStyle.lerp(primary, other.primary, t)!,
      secondary: TopBarStyle.lerp(secondary, other.secondary, t)!,
    );
  }
}
