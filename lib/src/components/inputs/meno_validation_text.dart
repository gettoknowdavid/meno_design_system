import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:meno_design_system/src/components/inputs/meno_textfield.dart';

/// {@template meno_validation_text}
/// A custom error message widget for the [MenoTextfield]
/// {@endtemplate}
class MenoValidationText extends StatelessWidget {
  /// {@macro meno_textfield}
  const MenoValidationText({
    required this.data,
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

  /// Optional [Color] for custom styling
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = MenoInputTheme.of(context);
    final effectiveStyle = theme.errorTextStyle.merge(style);
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
        Text(data, style: effectiveStyle),
      ],
    );
  }
}
