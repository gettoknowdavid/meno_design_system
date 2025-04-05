import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_outlined_button}
/// A custom Outlined text button widget that adapts to the platform.
/// {@endtemplate}
class MenoOutlinedButton extends OutlinedButton {
  /// {@macro meno_outlined_button}
  MenoOutlinedButton({
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

  /// Create an outlined button from [icon] and [label].
  ///
  /// The icon and label are arranged in a row with padding at the start and end
  /// and a gap between them.
  ///
  /// If [icon] is null, will create a [MenoOutlinedButton] instead.
  ///
  factory MenoOutlinedButton.icon({
    required Widget label,
    required VoidCallback? onPressed,
    MenoSize size = MenoSize.md,
    bool isLoading = false,
    bool disabled = false,
    Key? key,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    Widget? icon,
    IconAlignment? iconAlignment = IconAlignment.start,
  }) {
    if (icon == null) {
      return MenoOutlinedButton(
        key: key,
        onPressed: onPressed,
        size: size,
        isLoading: isLoading,
        disabled: disabled,
        onLongPress: onLongPress,
        onHover: onHover,
        onFocusChange: onFocusChange,
        style: style,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        clipBehavior: clipBehavior ?? Clip.none,
        child: label,
      );
    }
    return _MenoOutlinedButtonWithIcon(
      key: key,
      onPressed: onPressed,
      label: label,
      size: size,
      isLoading: isLoading,
      disabled: disabled,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      icon: icon,
      iconAlignment: iconAlignment,
    );
  }

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
    return _MenoOutlinedButtonDefaultStyle(context, size);
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) {
    return MenoButtonTheme.of(context).outlined;
  }
}

class _MenoOutlinedButtonDefaultStyle extends ButtonStyle {
  const _MenoOutlinedButtonDefaultStyle(this.context, this.size)
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

class _MenoOutlinedButtonWithIcon extends MenoOutlinedButton {
  _MenoOutlinedButtonWithIcon({
    required VoidCallback? onPressed,
    required Widget icon,
    required Widget label,
    super.size,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    bool? autofocus,
    super.clipBehavior,
    bool isLoading = false,
    IconAlignment? iconAlignment,
    super.disabled,
  }) : super(
         autofocus: autofocus ?? false,
         onPressed: disabled || isLoading ? null : onPressed,
         child: BaseButtonWithIcon(
           label: label,
           icon: icon,
           style: style,
           iconAlignment: iconAlignment,
           size: size,
           isLoading: isLoading,
         ),
       );
}
