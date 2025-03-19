import 'package:flutter/material.dart';
import 'package:meno_design_system/src/assets/fonts.gen.dart';
import 'package:meno_design_system/src/core/colors/meno_color_scheme.dart';

/// {@template meno_text_styles}
/// Text styles for the app
/// {@endtemplate}
@immutable
class MenoTextStyles {
  /// {@macro meno_theme}
  const MenoTextStyles({required this.colors});

  /// Get colors from Material [ColorScheme]
  final MenoColorScheme colors;

  /// Returns a `TextStyle` with predefined parameters
  TextStyle _style({
    required double fontSize,
    required double height,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontSize: fontSize,
      height: height,
      fontFamily: FontFamily.sFProDisplay,
      fontWeight: fontWeight,
      color: colors.materialColorScheme.onSurface,
      letterSpacing: 0,
    );
  }

  /// Heading 1 Regular
  TextStyle get heading1Regular => _style(fontSize: 32, height: 40.0 / 32.0);

  /// Heading 1 Medium
  TextStyle get heading1Medium =>
      _style(fontSize: 32, height: 40.0 / 32.0, fontWeight: FontWeight.w500);

  /// Heading 1 Bold
  TextStyle get heading1Bold =>
      _style(fontSize: 32, height: 40.0 / 32.0, fontWeight: FontWeight.bold);

  /// Heading 2 Regular
  TextStyle get heading2Regular => _style(fontSize: 24, height: 32.0 / 24.0);

  /// Heading 2 Medium
  TextStyle get heading2Medium =>
      _style(fontSize: 24, height: 32.0 / 24.0, fontWeight: FontWeight.w500);

  /// Heading 2 Bold
  TextStyle get heading2Bold =>
      _style(fontSize: 24, height: 32.0 / 24.0, fontWeight: FontWeight.bold);

  /// Subheading Regular
  TextStyle get subheadingRegular => _style(fontSize: 16, height: 24.0 / 16.0);

  /// Subheading Medium
  TextStyle get subheadingMedium =>
      _style(fontSize: 16, height: 24.0 / 16.0, fontWeight: FontWeight.w500);

  /// Subheading Bold
  TextStyle get subheadingBold =>
      _style(fontSize: 16, height: 24.0 / 16.0, fontWeight: FontWeight.bold);

  /// Body Regular
  TextStyle get bodyRegular => _style(fontSize: 16, height: 24.0 / 16.0);

  /// Body Medium
  TextStyle get bodyMedium =>
      _style(fontSize: 16, height: 24.0 / 16.0, fontWeight: FontWeight.w500);

  /// Body Bold
  TextStyle get bodyBold =>
      _style(fontSize: 16, height: 24.0 / 16.0, fontWeight: FontWeight.bold);

  /// Caption Regular
  TextStyle get captionRegular => _style(fontSize: 14, height: 16.0 / 14.0);

  /// Caption Medium
  TextStyle get captionMedium =>
      _style(fontSize: 14, height: 16.0 / 14.0, fontWeight: FontWeight.w500);

  /// Caption Bold
  TextStyle get captionBold =>
      _style(fontSize: 14, height: 16.0 / 14.0, fontWeight: FontWeight.bold);

  /// Micro Regular
  TextStyle get microRegular => _style(fontSize: 12, height: 16.0 / 12.0);

  /// Micro Medium
  TextStyle get microMedium =>
      _style(fontSize: 12, height: 16.0 / 12.0, fontWeight: FontWeight.w500);

  /// Micro Bold
  TextStyle get microBold =>
      _style(fontSize: 12, height: 16.0 / 12.0, fontWeight: FontWeight.bold);

  /// Nano Regular
  TextStyle get nanoRegular => _style(fontSize: 10, height: 14.0 / 10.0);

  /// Nano Medium
  TextStyle get nanoMedium =>
      _style(fontSize: 10, height: 14.0 / 10.0, fontWeight: FontWeight.w500);

  /// Nano Bold
  TextStyle get nanoBold =>
      _style(fontSize: 10, height: 14.0 / 10.0, fontWeight: FontWeight.bold);

  /// Button
  TextStyle get button => _style(fontSize: 8, height: 16.0 / 8.0);
}
