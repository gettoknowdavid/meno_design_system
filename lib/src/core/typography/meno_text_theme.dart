import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_text_theme}
/// Theme class which provides configuration of [TextStyle]
/// {@endtemplate}
class MenoTextTheme extends ThemeExtension<MenoTextTheme> {
  /// {@macro meno_text_theme}
  const MenoTextTheme({
    required this.heading1Regular,
    required this.heading1Medium,
    required this.heading1Bold,
    required this.heading2Regular,
    required this.heading2Medium,
    required this.heading2Bold,
    required this.heading3Regular,
    required this.heading3Medium,
    required this.heading3Bold,
    required this.subheadingRegular,
    required this.subheadingMedium,
    required this.subheadingBold,
    required this.bodyRegular,
    required this.bodyMedium,
    required this.bodyBold,
    required this.captionRegular,
    required this.captionMedium,
    required this.captionBold,
    required this.microRegular,
    required this.microMedium,
    required this.microBold,
    required this.nanoRegular,
    required this.nanoMedium,
    required this.nanoBold,
    required this.button,
  });

  /// {@macro meno_text_theme}
  factory MenoTextTheme.$default(MenoColorScheme colors) {
    final color = colors.materialColorScheme.onSurface;
    return MenoTextTheme(
      heading1Regular: MenoTextStyles.heading1Regular.copyWith(color: color),
      heading1Medium: MenoTextStyles.heading1Medium.copyWith(color: color),
      heading1Bold: MenoTextStyles.heading1Bold.copyWith(color: color),
      heading2Regular: MenoTextStyles.heading2Regular.copyWith(color: color),
      heading2Medium: MenoTextStyles.heading2Medium.copyWith(color: color),
      heading2Bold: MenoTextStyles.heading2Bold.copyWith(color: color),
      heading3Regular: MenoTextStyles.heading3Regular.copyWith(color: color),
      heading3Medium: MenoTextStyles.heading3Medium.copyWith(color: color),
      heading3Bold: MenoTextStyles.heading3Bold.copyWith(color: color),
      subheadingRegular: MenoTextStyles.subheadingRegular.copyWith(
        color: color,
      ),
      subheadingMedium: MenoTextStyles.subheadingMedium.copyWith(color: color),
      subheadingBold: MenoTextStyles.subheadingBold.copyWith(color: color),
      bodyRegular: MenoTextStyles.bodyRegular.copyWith(color: color),
      bodyMedium: MenoTextStyles.bodyMedium.copyWith(color: color),
      bodyBold: MenoTextStyles.bodyBold.copyWith(color: color),
      captionRegular: MenoTextStyles.captionRegular.copyWith(color: color),
      captionMedium: MenoTextStyles.captionMedium.copyWith(color: color),
      captionBold: MenoTextStyles.captionBold.copyWith(color: color),
      microRegular: MenoTextStyles.microRegular.copyWith(color: color),
      microMedium: MenoTextStyles.microMedium.copyWith(color: color),
      microBold: MenoTextStyles.microBold.copyWith(color: color),
      nanoRegular: MenoTextStyles.nanoRegular.copyWith(color: color),
      nanoMedium: MenoTextStyles.nanoMedium.copyWith(color: color),
      nanoBold: MenoTextStyles.nanoBold.copyWith(color: color),
      button: MenoTextStyles.button.copyWith(color: color),
    );
  }

  /// {@macro meno_text_theme}
  factory MenoTextTheme.of(BuildContext context) {
    final theme = Theme.of(context).extension<MenoTheme>()!;
    return theme.textTheme as MenoTextTheme;
  }

  /// Heading 1 Regular TextStyle
  final TextStyle heading1Regular;

  /// Heading1 Medium TextStyle
  final TextStyle heading1Medium;

  /// Heading1 Bold TextStyle
  final TextStyle heading1Bold;

  /// Heading 2 Regular TextStyle
  final TextStyle heading2Regular;

  /// Heading2 Medium TextStyle
  final TextStyle heading2Medium;

  /// Heading2 Bold TextStyle
  final TextStyle heading2Bold;

  /// Heading 3 Regular TextStyle
  final TextStyle heading3Regular;

  /// Heading3 Medium TextStyle
  final TextStyle heading3Medium;

  /// Heading3 Bold TextStyle
  final TextStyle heading3Bold;

  /// Subheading Regular TextStyle
  final TextStyle subheadingRegular;

  /// Subheading Medium TextStyle
  final TextStyle subheadingMedium;

  /// Hubheading Bold TextStyle
  final TextStyle subheadingBold;

  /// Body Regular TextStyle
  final TextStyle bodyRegular;

  /// body Medium TextStyle
  final TextStyle bodyMedium;

  /// Hody Bold TextStyle
  final TextStyle bodyBold;

  /// Caption Regular TextStyle
  final TextStyle captionRegular;

  /// Caption Medium TextStyle
  final TextStyle captionMedium;

  /// Caption Bold TextStyle
  final TextStyle captionBold;

  /// Micro Regular TextStyle
  final TextStyle microRegular;

  /// Micro Medium TextStyle
  final TextStyle microMedium;

  /// Micro Bold TextStyle
  final TextStyle microBold;

  /// Nano Regular TextStyle
  final TextStyle nanoRegular;

  /// Nano Medium TextStyle
  final TextStyle nanoMedium;

  /// Hano Bold TextStyle
  final TextStyle nanoBold;

  /// Button TextStyle
  final TextStyle button;

  @override
  ThemeExtension<MenoTextTheme> copyWith({
    TextStyle? heading1Regular,
    TextStyle? heading1Medium,
    TextStyle? heading1Bold,
    TextStyle? heading2Regular,
    TextStyle? heading2Medium,
    TextStyle? heading2Bold,
    TextStyle? heading3Regular,
    TextStyle? heading3Medium,
    TextStyle? heading3Bold,
    TextStyle? subheadingRegular,
    TextStyle? subheadingMedium,
    TextStyle? subheadingBold,
    TextStyle? bodyRegular,
    TextStyle? bodyMedium,
    TextStyle? bodyBold,
    TextStyle? captionRegular,
    TextStyle? captionMedium,
    TextStyle? captionBold,
    TextStyle? microRegular,
    TextStyle? microMedium,
    TextStyle? microBold,
    TextStyle? nanoRegular,
    TextStyle? nanoMedium,
    TextStyle? nanoBold,
    TextStyle? button,
  }) {
    return MenoTextTheme(
      heading1Regular: heading1Regular ?? this.heading1Regular,
      heading1Medium: heading1Medium ?? this.heading1Medium,
      heading1Bold: heading1Bold ?? this.heading1Bold,
      heading2Regular: heading2Regular ?? this.heading2Regular,
      heading2Medium: heading2Medium ?? this.heading2Medium,
      heading2Bold: heading2Bold ?? this.heading2Bold,
      heading3Regular: heading3Regular ?? this.heading3Regular,
      heading3Medium: heading3Medium ?? this.heading3Medium,
      heading3Bold: heading3Bold ?? this.heading3Bold,
      subheadingRegular: subheadingRegular ?? this.subheadingRegular,
      subheadingMedium: subheadingMedium ?? this.subheadingMedium,
      subheadingBold: subheadingBold ?? this.subheadingBold,
      bodyRegular: bodyRegular ?? this.bodyRegular,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodyBold: bodyBold ?? this.bodyBold,
      captionRegular: captionRegular ?? this.captionRegular,
      captionMedium: captionMedium ?? this.captionMedium,
      captionBold: captionBold ?? this.captionBold,
      microRegular: microRegular ?? this.microRegular,
      microMedium: microMedium ?? this.microMedium,
      microBold: microBold ?? this.microBold,
      nanoRegular: nanoRegular ?? this.nanoRegular,
      nanoMedium: nanoMedium ?? this.nanoMedium,
      nanoBold: nanoBold ?? this.nanoBold,
      button: button ?? this.button,
    );
  }

  @override
  ThemeExtension<MenoTextTheme> lerp(
    covariant ThemeExtension<MenoTextTheme>? other,
    double t,
  ) {
    if (other is! MenoTextTheme) return this;
    return MenoTextTheme(
      heading1Regular:
          TextStyle.lerp(heading1Regular, other.heading1Regular, t)!,
      heading1Medium: TextStyle.lerp(heading1Medium, other.heading1Medium, t)!,
      heading1Bold: TextStyle.lerp(heading1Bold, other.heading1Bold, t)!,
      heading2Regular:
          TextStyle.lerp(heading2Regular, other.heading2Regular, t)!,
      heading2Medium: TextStyle.lerp(heading2Medium, other.heading2Medium, t)!,
      heading2Bold: TextStyle.lerp(heading2Bold, other.heading2Bold, t)!,
      heading3Regular:
          TextStyle.lerp(heading3Regular, other.heading3Regular, t)!,
      heading3Medium: TextStyle.lerp(heading3Medium, other.heading3Medium, t)!,
      heading3Bold: TextStyle.lerp(heading3Bold, other.heading3Bold, t)!,
      subheadingRegular:
          TextStyle.lerp(subheadingRegular, other.subheadingRegular, t)!,
      subheadingMedium:
          TextStyle.lerp(subheadingMedium, other.subheadingMedium, t)!,
      subheadingBold: TextStyle.lerp(subheadingBold, other.subheadingBold, t)!,
      bodyRegular: TextStyle.lerp(bodyRegular, other.bodyRegular, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodyBold: TextStyle.lerp(bodyBold, other.bodyBold, t)!,
      captionRegular: TextStyle.lerp(captionRegular, other.captionRegular, t)!,
      captionMedium: TextStyle.lerp(captionMedium, other.captionMedium, t)!,
      captionBold: TextStyle.lerp(captionBold, other.captionBold, t)!,
      microRegular: TextStyle.lerp(microRegular, other.microRegular, t)!,
      microMedium: TextStyle.lerp(microMedium, other.microMedium, t)!,
      microBold: TextStyle.lerp(microBold, other.microBold, t)!,
      nanoRegular: TextStyle.lerp(nanoRegular, other.nanoRegular, t)!,
      nanoMedium: TextStyle.lerp(nanoMedium, other.nanoMedium, t)!,
      nanoBold: TextStyle.lerp(nanoBold, other.nanoBold, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
    );
  }
}
