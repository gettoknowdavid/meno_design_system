import 'package:flutter/material.dart';
import 'package:meno_design_system/src/theme/meno_theme.dart';

/// {@template meno_theme_scope}
/// InheritedWidget provides [MenoTheme] for app
/// {@endtemplate}
class MenoThemeScope extends InheritedWidget {
  /// {@macro meno_theme_scope}
  const MenoThemeScope({
    required super.child,
    required this.themeMode,
    required this.appTheme,
    super.key,
  });

  /// The current theme mode.
  final ThemeMode themeMode;

  /// The current app theme.
  final MenoTheme appTheme;

  /// The current theme.
  static MenoThemeScope of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<MenoThemeScope>();
    assert(result != null, 'No MenoThemeScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MenoThemeScope oldWidget) => true;
}
