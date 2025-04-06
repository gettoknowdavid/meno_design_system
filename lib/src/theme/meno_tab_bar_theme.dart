import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_tab_bar_theme}
/// Custom implementation of theme configurations for [MenoTabBar]
/// {@endtemplate}
class MenoTabBarTheme extends ThemeExtension<MenoTabBarTheme> {
  /// {@macro meno_tab_bar_theme}
  MenoTabBarTheme({
    required this.normal,
    required this.contained,
    required this.padding,
    required this.labelPadding,
    required this.height,
  });

    /// Snackbar theme
  factory MenoTabBarTheme.of(BuildContext context) {
    final theme = Theme.of(context).extension<MenoTheme>()!;
    return theme.tabBarTheme as MenoTabBarTheme;
  }

  /// {@macro meno_tab_bar_theme}
  factory MenoTabBarTheme.$default(MenoColorScheme colors) {
    final iconTheme = IconThemeData(size: 15, color: colors.labelHelp);
    return MenoTabBarTheme(
      normal: TabBarStyle(
        labelColor: Internal.resolveWith(
          colors.labelHelp,
          selected: colors.buttonLabelSecondary,
        ),
        backgroundColor: Internal.all(Colors.transparent),
        dividerColor: colors.strokeSoft,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: colors.buttonFill),
        ),
        dividerHeight: 1,
        iconTheme: Internal.resolveWith(
          iconTheme,
          selected: iconTheme.copyWith(color: colors.buttonLabelSecondary),
        ),
      ),
      contained: TabBarStyle(
        labelColor: Internal.resolveWith(
          colors.labelHelp,
          selected: colors.buttonLabelPrimary,
        ),
        backgroundColor: Internal.resolveWith(
          colors.componentSecondary,
          selected: colors.buttonFill,
        ),
        dividerColor: Colors.transparent,
        indicator: const BoxDecoration(),
        dividerHeight: 0,
        iconTheme: Internal.resolveWith(
          iconTheme,
          selected: iconTheme.copyWith(color: colors.buttonLabelPrimary),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: Insets.lg),
      labelPadding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
      height: 32,
    );
  }

  /// [TabBarStyle]s for the [MenoTabBar.normal] tab bar
  final TabBarStyle normal;

  /// [TabBarStyle]s for the [MenoTabBar.contained] tab bar
  final TabBarStyle contained;

  /// Padding given to the [MenoTabBar]
  final EdgeInsetsGeometry padding;

  /// Padding for the individual [MenoTab] labels
  final EdgeInsetsGeometry labelPadding;

  /// Height of the [MenoTabBar]
  final double height;

  @override
  MenoTabBarTheme copyWith({
    TabBarStyle? normal,
    TabBarStyle? contained,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? labelPadding,
    double? height,
  }) {
    return MenoTabBarTheme(
      normal: normal ?? this.normal,
      contained: contained ?? this.contained,
      padding: padding ?? this.padding,
      labelPadding: labelPadding ?? this.labelPadding,
      height: height ?? this.height,
    );
  }

  @override
  ThemeExtension<MenoTabBarTheme> lerp(
    covariant ThemeExtension<MenoTabBarTheme>? other,
    double t,
  ) {
    if (other is! MenoTabBarTheme) return this;
    return MenoTabBarTheme(
      normal: TabBarStyle.lerp(normal, other.normal, t)!,
      contained: TabBarStyle.lerp(contained, other.contained, t)!,
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t)!,
      labelPadding:
          EdgeInsetsGeometry.lerp(labelPadding, other.labelPadding, t)!,

      height: lerpDouble(height, other.height, t)!,
    );
  }
}
