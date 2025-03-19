import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// A button widget that displays an icon and text in a row.
///
/// This widget is used internally by [MenoButton] to render the icon and text
/// with the specified placement.
class _MenoButtonWithIcon extends StatelessWidget {
  /// Creates an instance of [_MenoButtonWithIcon].
  ///
  /// Parameters:
  /// - [icon]: The icon to be displayed.
  /// - [label]: The text label for the button.
  /// - [iconAlignment]: The placement of the icon relative to the text.
  const _MenoButtonWithIcon({
    required this.icon,
    required this.label,
    this.iconAlignment = IconAlignment.start,
  });

  /// The icon to be displayed in the button.
  final Widget icon;

  /// The text label for the button.
  final String label;

  /// The placement of the icon relative to the text.
  final IconAlignment? iconAlignment;

  @override
  Widget build(BuildContext context) {
    // final scale = MediaQuery.textScalerOf(context).scale(14);
    // final effectiveScale = clampDouble(scale / 14.0, 1, 2) - 1.0;
    // final gap = SizedBox(width: lerpDouble(8, 4, effectiveScale));

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (iconAlignment == IconAlignment.start) ...[icon],
        Flexible(child: Text(label)),
        if (iconAlignment == IconAlignment.end) ...[icon],
      ],
    );
  }
}


/// {@template meno_button}
/// A custom text button widget that adapts to the platform.
/// {@endtemplate}
abstract class MenoButton extends StatelessWidget {
  /// {@macro meno_theme}
  const MenoButton({
    required String label,
    MenoSize size = MenoSize.md,
    Key? key,
    ButtonStyle? style,
    VoidCallback? onTap,
    bool isLoading = false,
  }) : this._(
         key: key,
         label: label,
         size: size,
         style: style,
         onTap: onTap,
         isLoading: isLoading,
       );

  const MenoButton._({
    required this.label,
    this.onTap,
    super.key,
    this.size = MenoSize.md,
    this.icon,
    this.iconAlignment = IconAlignment.start,
    this.style,
    this.isLoading = false,
  });

  /// Creates a button with an icon and text.
  ///
  /// The button displays an icon and a text label. The icon's placement
  /// relative to the text can be specified using the [iconAlignment] parameter.
  ///
  /// Parameters:
  /// - [label]: The text label for the button.
  /// - [icon]: The icon to be displayed alongside the text.
  /// - [onTap]: The callback to be invoked when the button is pressed.
  /// - [key]: An optional key to identify the widget.
  /// - [iconAlignment]: The placement of the icon relative to the text.
  /// Defaults to [IconAlignment.start].
  /// - [style]: An optional [ButtonStyle] to customize the button's appearance.
  const MenoButton.icon({
    required String label,
    required Widget icon,
    required VoidCallback? onTap,
    Key? key,
    MenoSize size = MenoSize.md,
    IconAlignment? iconAlignment = IconAlignment.start,
    ButtonStyle? style,
    bool isLoading = false,
  }) : this._(
         key: key,
         label: label,
         size: size,
         icon: icon,
         iconAlignment: iconAlignment,
         style: style,
         onTap: onTap,
         isLoading: isLoading,
       );

  /// The label of the button
  final String label;

  /// The callback function for the text button.
  final VoidCallback? onTap;

  /// The size of the text button.
  final MenoSize size;

  /// The loading state of the button.
  final bool isLoading;

  /// The Button style
  final ButtonStyle? style;

  /// Leading widget like an icon
  final Widget? icon;

  /// The effect of iconAlignment depends on [TextDirection].
  /// If textDirection is [TextDirection.ltr] then [IconAlignment.start]
  /// and [IconAlignment.end] align the icon on the left or right respectively.
  /// If textDirection is [TextDirection.rtl] the the alignments are reversed.
  final IconAlignment? iconAlignment;

  /// Describes the part of the button represented by this widget.
  Widget buildButton(BuildContext context, Widget child);

  @override
  Widget build(BuildContext context) {
    late final height = ButtonHelpers.buttonHeight(size);
    Widget child;
    if (icon != null) {
      child = _MenoButtonWithIcon(
        iconAlignment: iconAlignment,
        icon: icon!,
        label: label,
      );
    } else {
      child = Text(label);
    }

    return SizedBox(height: height, child: buildButton(context, child));
  }
}
