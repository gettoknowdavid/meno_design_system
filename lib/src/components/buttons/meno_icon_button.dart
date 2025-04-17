import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// A customizable icon button widget.
///
/// This widget represents a circular button with an icon. It supports
/// customization of size, color, and padding, and can be either filled or
/// outlined.
///
/// The button can trigger a callback when pressed.
///
class MenoIconButton extends StatelessWidget {
  /// Creates an instance of [MenoIconButton].
  const MenoIconButton(
    this.icon, {
    required this.onPressed,
    super.key,
    this.iconSize,
    this.padding,
    this.color,
    this.fixedSize,
    this.semanticLabel,
  }) : _filled = false,
       _fillColor = null;

  /// Creates an instance of [MenoIconButton] with a filled style.
  const MenoIconButton.filled(
    this.icon, {
    required this.onPressed,
    super.key,
    this.iconSize,
    this.padding,
    this.color,
    this.fixedSize,
    this.semanticLabel,
    Color? fillColor,
  }) : _filled = true,
       _fillColor = fillColor;

  /// The icon widget to be displayed inside the button.
  final IconData icon;

  /// An optional callback function to be invoked when the button is pressed.
  final VoidCallback onPressed;

  /// The size of the icon.
  final double? iconSize;

  /// The padding around the icon.
  final EdgeInsetsGeometry? padding;

  /// The color of the icon. If not provided, it defaults to the theme's icon
  /// color.
  final Color? color;

  /// The size of the button (diameter of the circle). Defaults to 24.
  final Size? fixedSize;

  /// Semantic label
  final String? semanticLabel;

  /// Whether the button is filled not.
  final bool _filled;

  final Color? _fillColor;

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(icon);
    final style = ButtonStyle(
      padding: Internal.all(padding ?? EdgeInsets.zero),
      iconColor: Internal.all(color),
      iconSize: Internal.all(iconSize),
      backgroundColor: _filled ? Internal.all(_fillColor) : null,
    );

    return SizedBox.fromSize(
      size: fixedSize ?? const Size.square(24),
      child: Semantics(
        label: semanticLabel,
        button: true,
        child:
            _filled
                ? IconButton.filled(
                  onPressed: onPressed,
                  icon: iconWidget,
                  style: style,
                )
                : IconButton(
                  onPressed: onPressed,
                  icon: iconWidget,
                  style: style,
                ),
      ),
    );
  }
}
