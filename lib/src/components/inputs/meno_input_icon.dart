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
  final IconData icon;

  /// [MenoSize] value
  final MenoSize size;

  /// Optional color
  final Color? color;

  /// Alignment of the icon
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    late final iconSize = switch (size) {
      MenoSize.xs => 16.0,
      MenoSize.sm => 16.0,
      MenoSize.md => 18.0,
      MenoSize.lg => 20.0,
    };

    late final padding = switch (size) {
      MenoSize.xs => 2.0,
      MenoSize.sm => 2.0,
      MenoSize.md => 2.0,
      MenoSize.lg => 4.0,
    };

    return Container(
      width: iconSize,
      alignment: alignment,
      padding:
          alignment == Alignment.centerRight
              ? EdgeInsets.only(right: padding)
              : EdgeInsets.only(left: padding),
      child: Icon(icon, size: iconSize, color: color),
    );
  }
}
