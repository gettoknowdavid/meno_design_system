import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart'
    show
        MenoButtonTheme,
        MenoLoadingIndicator,
        MenoLoadingIndicatorBySize,
        MenoSize;
import 'package:meno_design_system/src/components/buttons/buttons.dart';

/// {@template meno_white_button}
/// A custom primary text button widget that adapts to the platform.
/// {@endtemplate}
class MenoWhiteButton extends FilledButton {
  /// {@macro meno_white_button}
  MenoWhiteButton({
    required Widget child,
    required VoidCallback? onPressed,
    this.size = MenoSize.md,
    this.isLoading = false,
    this.disabled = false,
    super.style,
    super.key,
    super.onHover,
    super.onLongPress,
    super.onFocusChange,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior = Clip.none,
  }) : super(
         child: isLoading ? MenoLoadingIndicatorBySize(size) : child,
         onPressed: disabled || isLoading ? null : onPressed,
       );

  /// The size of the button
  ///
  /// [MenoSize.xs] - Mciro
  /// [MenoSize.sm] - Small
  /// [MenoSize.md] - Medium
  /// [MenoSize.lg] - Large
  ///
  /// The default is [MenoSize.md]
  final MenoSize size;

  /// Flag to set the loading state of the button. Shows the
  /// [MenoLoadingIndicator] widget
  final bool isLoading;

  /// Flag to set the button to the disabled state
  final bool disabled;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    return _MenoWhiteButtonDefaultStyle(context, size);
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return MenoButtonTheme.of(context).white;
  }
}

class _MenoWhiteButtonDefaultStyle extends ButtonStyle {
  const _MenoWhiteButtonDefaultStyle(this.context, this.size)
    : super(
        animationDuration: kThemeChangeDuration,
        enableFeedback: true,
        alignment: Alignment.center,
      );

  final BuildContext context;
  final MenoSize size;

  @override
  WidgetStateProperty<TextStyle?> get textStyle =>
      BaseButton.textStyle(size, context);

  @override
  WidgetStateProperty<EdgeInsetsGeometry>? get padding =>
      BaseButton.padding(size);

  @override
  WidgetStateProperty<double>? get iconSize => BaseButton.iconSize(size);

  @override
  WidgetStateProperty<Size>? get minimumSize => BaseButton.minimumSize(size);

  @override
  WidgetStateProperty<Size>? get maximumSize => BaseButton.maximumSize(size);

  @override
  WidgetStateProperty<Size>? get fixedSize => BaseButton.maximumSize(size);

  @override
  WidgetStateProperty<OutlinedBorder>? get shape => BaseButton.border(size);
}
