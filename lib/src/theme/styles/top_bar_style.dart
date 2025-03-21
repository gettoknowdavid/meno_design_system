import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template top_bar_style}
/// The theme for the [MenoTopBar]
/// {@endtemplate}
class TopBarStyle {
  /// {@macro top_bar_style}
  TopBarStyle({
    this.topbarHeight,
    this.backgroundColor,
    this.titleColor,
    this.leadingColor,
    this.actionColor,
    this.accentColor,
    this.bottomBorder,
    this.textStyle,
    this.leadingTextStyle,
  });

  /// Height of the top bar
  final double? topbarHeight;

  /// The background color of the top bar
  final Color? backgroundColor;

  /// Color of the title text
  final Color? titleColor;

  /// Color of the leading icon or back button
  final Color? leadingColor;

  /// Color of the action buttons
  final Color? actionColor;

  /// The accent color used for the geometric lines on the [TopBarType.primary]
  final Color? accentColor;

  /// The bottome border of the top bar
  final ShapeBorder? bottomBorder;

  /// The top bar's title text style
  final TextStyle? textStyle;

  /// The text style of the leading text
  final TextStyle? leadingTextStyle;

  /// Linearly interpolate between two [TopBarStyle]s.
  static TopBarStyle? lerp(TopBarStyle? a, TopBarStyle? b, double t) {
    if (identical(a, b)) return a;
    return TopBarStyle(
      topbarHeight: b!.topbarHeight,
      backgroundColor: Color.lerp(a?.backgroundColor, b.backgroundColor, t),
      titleColor: Color.lerp(a?.titleColor, b.titleColor, t),
      leadingColor: Color.lerp(a?.leadingColor, b.leadingColor, t),
      actionColor: Color.lerp(a?.actionColor, b.actionColor, t),
      accentColor: Color.lerp(a?.accentColor, b.accentColor, t),
      bottomBorder: ShapeBorder.lerp(a?.bottomBorder, b.bottomBorder, t),
      textStyle: TextStyle.lerp(a?.textStyle, b.textStyle, t),
      leadingTextStyle: TextStyle.lerp(
        a?.leadingTextStyle,
        b.leadingTextStyle,
        t,
      ),
    );
  }
}
