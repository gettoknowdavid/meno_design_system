import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template base_snackbar}
/// Custom implementation of a [SnackBar]
/// {@endtemplate}
class BaseSnackBar extends StatelessWidget {
  /// {@macro base_snackbar}
  const BaseSnackBar(
    this.text, {
    super.key,
    this.backgroundColor,
    this.textColor,
    this.action,
    this.showCloseIcon = false,
    this.size = MenoSize.sm,
  }) : assert(
         size != MenoSize.lg || action != null,
         'If MenoSize.lg is used, an action button must be provided.',
       );

  /// The message of the [MenoSnackBar]
  final String text;

  /// Color of the main container of the [MenoSnackBar]
  final Color? backgroundColor;

  /// Color of `message` and [MenoSnackBarAction] of the [MenoSnackBar]
  final Color? textColor;

  /// Action button for the [MenoSnackBar]
  final MenoSnackBarAction? action;

  /// If the close icon of the [MenoSnackBar] show be visible
  final bool showCloseIcon;

  /// Size of the [MenoSnackBar]
  final MenoSize size;

  @override
  Widget build(BuildContext context) {
    final theme = MenoSnackbarTheme.of(context);
    final effectiveBackgroundColor = backgroundColor ?? theme.backgroundColor;
    final effectiveForegroundColor = textColor ?? theme.foregroundColor;

    final snackBarText = _Content(
      text,
      size: size,
      color: effectiveForegroundColor,
    );

    final Widget? actionWidget =
        action != null
            ? DefaultTextStyle(
              style: theme.textStyle.copyWith(color: effectiveForegroundColor),
              child: action!,
            )
            : null;

    final Widget body =
        size == MenoSize.lg
            ? SizedBox(
              height: 60,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: snackBarText),
                  const MenoSpacer.v(8),
                  Align(alignment: Alignment.centerRight, child: actionWidget),
                ],
              ),
            )
            : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: snackBarText),
                if (actionWidget != null) ...[
                  const MenoSpacer.h(8),
                  actionWidget,
                ],
                if (showCloseIcon) ...[
                  const MenoSpacer.h(8),
                  _CloseButton(color: textColor),
                ],
              ],
            );

    return Container(
      padding: theme.contentPadding,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: MenoBorderRadius.sm,
        color: effectiveBackgroundColor,
      ),
      child: body,
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = MenoSnackbarTheme.of(context);
    final effectiveForegroundColor = color ?? theme.foregroundColor;

    void close() => ScaffoldMessenger.of(context).removeCurrentSnackBar();

    return SizedBox.square(
      dimension: 20,
      child: IconButton(
        onPressed: close,
        iconSize: 20,
        style: IconButton.styleFrom(padding: EdgeInsets.zero),
        color: effectiveForegroundColor,
        icon: const Icon(MIcons.x_close),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content(this.message, {this.size = MenoSize.md, this.color});
  final String message;
  final MenoSize size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = MenoSnackbarTheme.of(context);
    final effectiveForegroundColor = color ?? theme.foregroundColor;

    final isSmall = size == MenoSize.xs;

    return SizedBox(
      height: _height,
      child: MenoText.caption(
        message,
        color: effectiveForegroundColor,
        maxLines: isSmall ? 1 : 2,
        weight: MenoFontWeight.regular,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  double get _height => switch (size) {
    MenoSize.md || MenoSize.lg => 36,
    _ => 18,
  };
}
