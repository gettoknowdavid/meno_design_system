import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:meno_design_system/src/components/snackbars/base_snackbar.dart';

/// {@template meno_snackbar}
/// Snac bar component
/// {@endtemplate}
class MenoSnackBar {
  /// {@macro meno_snackbar_theme}
  factory MenoSnackBar() => _instance;
  MenoSnackBar._internal();

  static final MenoSnackBar _instance = MenoSnackBar._internal();

  static final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  /// Snack bar [ScaffoldMessengerState] key
  static GlobalKey<ScaffoldMessengerState> get key => _scaffoldMessengerKey;

  /// Hide sback bar
  static void get hideAll =>
      _scaffoldMessengerKey.currentState?.clearSnackBars();

  /// Hide sback bar
  static void get hide =>
      _scaffoldMessengerKey.currentState?.hideCurrentSnackBar();

  /// Show Toast
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? show(
    String text, {
    MenoSnackBarAction? action,
    bool showCloseIcon = false,
    MenoSize size = MenoSize.sm,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: BaseSnackBar(
          text,
          action: action,
          showCloseIcon: showCloseIcon,
          size: size,
          textColor: textColor,
          backgroundColor: backgroundColor,
        ),
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        elevation: 0,
        shape: const RoundedRectangleBorder(),
      ),
    );
  }

  /// Show Error Toast
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? error(
    String text, {
    MenoSnackBarAction? action,
    bool showCloseIcon = false,
    MenoSize size = MenoSize.sm,
  }) {
    final context = _scaffoldMessengerKey.currentContext!;
    final colors = MenoColorScheme.of(context);
    final isLight = colors.brightness == Brightness.light;
    return show(
      text,
      action: action,
      showCloseIcon: showCloseIcon,
      size: size,
      backgroundColor: Internal.resolve(
        isLight,
        MenoColors.red.shade500,
        MenoColors.red.shade200,
      ),
      textColor: Internal.resolve(
        isLight,
        MenoColors.red.shade50,
        MenoColors.red.shade800,
      ),
    );
  }
}
