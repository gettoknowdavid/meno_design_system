import 'dart:ui';

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
    this.leadingWidth,
    this.titleSpacing,
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

  /// The accent color used for the geometric lines on the [MenoTopBar.primary]
  final Color? accentColor;

  /// The bottome border of the top bar
  final ShapeBorder? bottomBorder;

  /// The top bar's title text style
  final TextStyle? textStyle;

  /// The text style of the leading text
  final TextStyle? leadingTextStyle;

  /// Width of the leading widget
  final double? leadingWidth;

  /// Title spacing
  final double? titleSpacing;

  /// Copywith method
  TopBarStyle copyWith({
    double? topbarHeight,
    Color? backgroundColor,
    Color? titleColor,
    Color? leadingColor,
    Color? actionColor,
    Color? accentColor,
    ShapeBorder? bottomBorder,
    TextStyle? textStyle,
    TextStyle? leadingTextStyle,
    double? leadingWidth,
    double? titleSpacing,
  }) {
    return TopBarStyle(
      topbarHeight: topbarHeight ?? this.topbarHeight,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      titleColor: titleColor ?? this.titleColor,
      leadingColor: leadingColor ?? this.leadingColor,
      actionColor: actionColor ?? this.actionColor,
      accentColor: accentColor ?? this.accentColor,
      bottomBorder: bottomBorder ?? this.bottomBorder,
      textStyle: textStyle ?? this.textStyle,
      leadingTextStyle: leadingTextStyle ?? this.leadingTextStyle,
      leadingWidth: leadingWidth ?? this.leadingWidth,
      titleSpacing: titleSpacing ?? this.titleSpacing,
    );
  }

  /// Linearly interpolate between two [TopBarStyle]s.
  static TopBarStyle? lerp(TopBarStyle? a, TopBarStyle? b, double t) {
    if (identical(a, b)) return a;
    return TopBarStyle(
      topbarHeight: lerpDouble(a?.topbarHeight, b?.topbarHeight, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      titleColor: Color.lerp(a?.titleColor, b?.titleColor, t),
      leadingColor: Color.lerp(a?.leadingColor, b?.leadingColor, t),
      actionColor: Color.lerp(a?.actionColor, b?.actionColor, t),
      accentColor: Color.lerp(a?.accentColor, b?.accentColor, t),
      bottomBorder: ShapeBorder.lerp(a?.bottomBorder, b?.bottomBorder, t),
      textStyle: TextStyle.lerp(a?.textStyle, b?.textStyle, t),
      leadingWidth: lerpDouble(a?.leadingWidth, b?.leadingWidth, t),
      titleSpacing: lerpDouble(a?.titleSpacing, b?.titleSpacing, t),
      leadingTextStyle: TextStyle.lerp(
        a?.leadingTextStyle,
        b?.leadingTextStyle,
        t,
      ),
    );
  }
}
