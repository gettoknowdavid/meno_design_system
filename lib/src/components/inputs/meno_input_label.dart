import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_input_icon}
/// A custom icon widget for a [MenoInputLabel]
/// {@endtemplate}
class MenoInputIcon extends StatelessWidget {
  /// {@macro meno_input_icon}
  const MenoInputIcon(
    this.icon, {
    super.key,
    this.size = MenoSize.md,
    this.color,
    this.alignment = Alignment.centerRight,
  });

  /// Icon widget
  final Widget icon;

  /// [MenoSize] value
  final MenoSize size;

  /// Optional color
  final Color? color;

  /// Alignment of the icon
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    final inputTheme = MenoInputTheme.of(context);

    late final iconSize = switch (size) {
      MenoSize.sm => 14.0,
      MenoSize.md => 16.0,
      _ => 20.0,
    };

    return Container(
      width: iconSize,
      alignment: alignment,
      child: IconTheme(
        data: IconThemeData(
          color: color ?? inputTheme.textStyle.color,
          size: iconSize,
        ),
        child: icon,
      ),
    );
  }
}

/// {@template meno_input_label}
/// A custom text field class for input with validation
/// {@endtemplate}
class MenoInputLabel extends StatelessWidget {
  /// {@macro meno_textfield}
  const MenoInputLabel(
    this.data, {
    super.key,
    this.icon,
    this.style,
    this.color,
  });

  /// The string to be displayed
  final String data;

  /// The optional icon
  final Widget? icon;

  /// Optional [TextStyle] for custom styling
  final TextStyle? style;

  /// Optional color
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = MenoInputTheme.of(context);
    final effectiveStyle = theme.labelTextStyle.merge(style);
    final effectiveColor = color ?? effectiveStyle.color;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          IconTheme(
            data: IconThemeData(size: Insets.lg, color: effectiveColor),
            child: icon!,
          ),
          const SizedBox(width: 6),
        ],
        Text(data, style: effectiveStyle.copyWith(color: color)),
      ],
    );
  }
}
