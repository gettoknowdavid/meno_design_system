import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_input_label}
/// A custom input label class
/// {@endtemplate}
class MenoInputLabel extends StatelessWidget {
  /// {@macro meno_input_label}
  const MenoInputLabel(
    this.data, {
    super.key,
    this.icon,
    this.style,
    this.color,
    this.required = false,
    this.enabled = true,
  });

  /// The string to be displayed
  final String data;

  /// The optional icon
  final Widget? icon;

  /// Optional [TextStyle] for custom styling
  final TextStyle? style;

  /// Optional color
  final Color? color;

  /// A boolean indicating whether the field is required. Defaults to false.
  final bool required;

  /// If the field is enabled
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = MenoInputTheme.of(context);
    final effectiveStyle = style ?? theme.labelTextStyle;
    final effectiveColor = color ?? effectiveStyle.color;
    final asteriskColor = !enabled ? theme.disabledColor : theme.errorColor;
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
        Text(data, style: effectiveStyle.copyWith(color: effectiveColor)),
        if (required) ...[
          const SizedBox(width: Insets.xs),
          Text('*', style: theme.labelTextStyle.copyWith(color: asteriskColor)),
        ],
      ],
    );
  }
}
