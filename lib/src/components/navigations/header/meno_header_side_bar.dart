import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_header_side_bar}
/// The Meno Header side bar
/// {@endtemplate}
class MenoHeaderSideBar extends StatelessWidget {
  /// {@macro meno_header_side_bar}
  const MenoHeaderSideBar({
    super.key,
    this.thickness = 4,
    this.color,
    this.height,
    this.margin,
  });

  /// Thickness of the bar
  final double? thickness;

  /// Color of the bar
  final Color? color;

  /// Height
  final double? height;

  /// Margin
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final colors = MenoColorScheme.of(context);
    return Center(
      child: Container(
        margin: margin,
        height: height ?? double.infinity,
        constraints: const BoxConstraints(maxHeight: 36, maxWidth: 4),
        width: thickness,
        color: color ?? colors.brandSecondary,
      ),
    );
  }
}
