import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template top_bar_style}
/// The theme for the [MenoHeader]
/// {@endtemplate}
class HeaderStyle {
  /// {@macro top_bar_style}
  const HeaderStyle({
    this.labelTextStyle,
    this.titleTextStyle,
    this.actionLabelTextStyle,
    this.padding,
    this.showSideBorder,
    this.sideBorderColor,
    this.sideBorderThickness,
    this.titleStartGap,
    this.titleEndGap,
    this.actionsSpacing,
    this.backgroundColor,
    this.foregroundColor,
  });

  /// Label textstyle
  final TextStyle? labelTextStyle;

  /// Title textstyle
  final TextStyle? titleTextStyle;

  /// Action label textstyle
  final TextStyle? actionLabelTextStyle;

  /// Content padding
  final EdgeInsetsGeometry? padding;

  /// If the red side border on the side of the header title should be shown
  final bool? showSideBorder;

  /// Thickness or width of the side border
  final double? sideBorderThickness;

  /// Color of the side border
  final Color? sideBorderColor;

  /// The gap at the start of the title, just after the leading
  final double? titleStartGap;

  /// The gap at the end of the title, just before the actions
  final double? titleEndGap;

  /// Text color of the header
  final double? actionsSpacing;

  /// Background color of the header
  final Color? backgroundColor;

  /// Text color of the header
  final Color? foregroundColor;

  /// CopyWith
  HeaderStyle copyWith({
    TextStyle? labelTextStyle,
    TextStyle? titleTextStyle,
    TextStyle? actionLabelTextStyle,
    EdgeInsetsGeometry? padding,
    bool? showSideBorder,
    Color? sideBorderColor,
    double? sideBorderThickness,
    double? titleStartGap,
    double? titleEndGap,
    double? actionsSpacing,
    Color? backgroundColor,
    Color? foregroundColor,
  }) {
    return HeaderStyle(
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      actionLabelTextStyle: actionLabelTextStyle ?? this.actionLabelTextStyle,
      padding: padding ?? this.padding,
      showSideBorder: showSideBorder ?? this.showSideBorder,
      sideBorderColor: sideBorderColor ?? this.sideBorderColor,
      sideBorderThickness: sideBorderThickness ?? this.sideBorderThickness,
      titleStartGap: titleStartGap ?? this.titleStartGap,
      titleEndGap: titleEndGap ?? this.titleEndGap,
      actionsSpacing: actionsSpacing ?? this.actionsSpacing,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
    );
  }

  /// Linearly interpolate between two [HeaderStyle]s.
  static HeaderStyle? lerp(HeaderStyle? a, HeaderStyle? b, double t) {
    if (identical(a, b)) return a;
    return HeaderStyle(
      labelTextStyle: TextStyle.lerp(a?.labelTextStyle, b?.labelTextStyle, t),
      titleTextStyle: TextStyle.lerp(a?.titleTextStyle, b?.titleTextStyle, t),
      actionLabelTextStyle: TextStyle.lerp(
        a?.actionLabelTextStyle,
        b?.actionLabelTextStyle,
        t,
      ),
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t),
      showSideBorder: b?.showSideBorder,
      sideBorderColor: Color.lerp(a?.sideBorderColor, b?.sideBorderColor, t),
      sideBorderThickness: lerpDouble(
        a?.sideBorderThickness,
        b?.sideBorderThickness,
        t,
      ),
      titleStartGap: lerpDouble(a?.titleStartGap, b?.titleStartGap, t),
      titleEndGap: lerpDouble(a?.titleEndGap, b?.titleEndGap, t),
      actionsSpacing: lerpDouble(a?.actionsSpacing, b?.actionsSpacing, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      foregroundColor: Color.lerp(a?.foregroundColor, b?.foregroundColor, t),
    );
  }
}
