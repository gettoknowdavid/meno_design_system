import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_color_scheme}
/// Theme class which provides configuration of a custom [ColorScheme]
/// {@endtemplate}
class MenoColorScheme extends ThemeExtension<MenoColorScheme> {
  /// {@macro meno_color_scheme}
  const MenoColorScheme({
    required this.brightness,
    required this.backgroundDefault,
    required this.cardPrimary,
    required this.componentPrimary,
    required this.componentSecondary,
    required this.componentWhite,
    required this.sectionPrimary,
    required this.brandPrimary,
    required this.brandPrimaryDark,
    required this.brandPrimaryLight,
    required this.brandPrimaryLighter,
    required this.brandSecondary,
    required this.brandSecondaryDark,
    required this.brandSecondaryLight,
    required this.brandSecondaryLighter,
    required this.brandTertiary,
    required this.buttonFill,
    required this.buttonLabelPrimary,
    required this.buttonLabelSecondary,
    required this.strokeStrong,
    required this.strokeSoft,
    required this.strokeWeak,
    required this.strokeSub,
    required this.labelPrimary,
    required this.labelHelp,
    required this.labelPlaceholder,
    required this.labelDisabled,
    required this.labelLink,
    required this.staticBlack,
    required this.staticWhite,
    required this.errorDark,
    required this.errorBase,
    required this.errorLight,
    required this.errorLighter,
    required this.successDark,
    required this.successBase,
    required this.successLight,
    required this.successLighter,
    required this.infoDark,
    required this.infoBase,
    required this.infoLight,
    required this.infoLighter,
    required this.warningDark,
    required this.warningBase,
    required this.warningLight,
    required this.warningLighter,
    required this.pendingDark,
    required this.pendingBase,
    required this.pendingLight,
    required this.pendingLighter,
    required this.disabledDark,
    required this.disabledBase,
    required this.disabledLight,
    required this.disabledLighter,
    required this.verifiedDark,
    required this.verifiedBase,
    required this.verifiedLight,
    required this.verifiedLighter,
    required this.notificationDark,
    required this.notificationBase,
    required this.notificationLight,
    required this.notificationLighter,
  });

  /// {@macro meno_color_scheme}
  factory MenoColorScheme.$default(Brightness brightness) {
    if (brightness == Brightness.light) return MenoColorScheme.light();
    return MenoColorScheme.dark();
  }

    /// {@macro meno_button_theme}
  factory MenoColorScheme.of(BuildContext context) {
    final theme = Theme.of(context).extension<MenoTheme>()!;
    return theme.colors as MenoColorScheme;
  }

  /// {@macro meno_color_scheme}
  factory MenoColorScheme.light() {
    return MenoColorScheme(
      brightness: Brightness.light,
      backgroundDefault: MenoColors.neutral[0]!,
      cardPrimary: MenoColors.neutral.shade50,
      componentPrimary: MenoColors.neutral.shade100,
      componentSecondary: MenoColors.neutral.shade200,
      componentWhite: MenoColors.neutral[0]!,
      sectionPrimary: MenoColors.neutral[0]!,
      brandPrimary: MenoColors.purple.shade500,
      brandPrimaryDark: MenoColors.purple.shade700,
      brandPrimaryLight: MenoColors.purple.shade100,
      brandPrimaryLighter: MenoColors.purple.shade50,
      brandSecondary: MenoColors.scarlet.shade500,
      brandSecondaryDark: MenoColors.scarlet.shade700,
      brandSecondaryLight: MenoColors.scarlet.shade100,
      brandSecondaryLighter: MenoColors.scarlet.shade50,
      brandTertiary: MenoColors.yellow.shade500,
      buttonFill: MenoColors.purple.shade500,
      buttonLabelPrimary: MenoColors.neutral[0]!,
      buttonLabelSecondary: MenoColors.purple.shade500,
      strokeStrong: MenoColors.neutral[950]!,
      strokeSoft: MenoColors.neutral.shade300,
      strokeWeak: MenoColors.neutral.shade200,
      strokeSub: MenoColors.neutral.shade300,
      labelPrimary: MenoColors.neutral[950]!,
      labelHelp: MenoColors.neutral.shade600,
      labelPlaceholder: MenoColors.neutral.shade400,
      labelDisabled: MenoColors.neutral.shade500,
      labelLink: MenoColors.blue.shade500,
      staticBlack: MenoColors.neutral[950]!,
      staticWhite: MenoColors.neutral[0]!,
      errorDark: MenoColors.red.shade900,
      errorBase: MenoColors.red.shade500,
      errorLight: MenoColors.red.shade100,
      errorLighter: MenoColors.red.shade50,
      successDark: MenoColors.green.shade900,
      successBase: MenoColors.green.shade700,
      successLight: MenoColors.green.shade200,
      successLighter: MenoColors.green.shade50,
      infoDark: MenoColors.blue.shade900,
      infoBase: MenoColors.blue.shade500,
      infoLight: MenoColors.blue.shade200,
      infoLighter: MenoColors.blue.shade50,
      warningDark: MenoColors.orange.shade900,
      warningBase: MenoColors.orange.shade500,
      warningLight: MenoColors.orange.shade200,
      warningLighter: MenoColors.orange.shade50,
      pendingDark: MenoColors.yellow.shade700,
      pendingBase: MenoColors.yellow.shade500,
      pendingLight: MenoColors.yellow.shade200,
      pendingLighter: MenoColors.yellow.shade50,
      disabledDark: MenoColors.neutral.shade800,
      disabledBase: MenoColors.neutral.shade500,
      disabledLight: MenoColors.neutral.shade300,
      disabledLighter: MenoColors.neutral.shade200,
      verifiedDark: MenoColors.sky.shade900,
      verifiedBase: MenoColors.sky.shade700,
      verifiedLight: MenoColors.sky.shade200,
      verifiedLighter: MenoColors.sky.shade50,
      notificationDark: MenoColors.red.shade900,
      notificationBase: MenoColors.red.shade500,
      notificationLight: MenoColors.red.shade200,
      notificationLighter: MenoColors.red.shade50,
    );
  }

  /// {@macro meno_color_scheme}
  factory MenoColorScheme.dark() {
    return MenoColorScheme(
      brightness: Brightness.dark,
      backgroundDefault: MenoColors.purple[950]!,
      cardPrimary: MenoColors.violet.shade700,
      componentPrimary: MenoColors.violet.shade500,
      componentSecondary: MenoColors.violet.shade500,
      componentWhite: MenoColors.purpleSpecial,
      sectionPrimary: MenoColors.violet.shade700,
      brandPrimary: MenoColors.purpleSpecial,
      brandPrimaryDark: MenoColors.purple.shade400,
      brandPrimaryLight: MenoColors.purple.shade50,
      brandPrimaryLighter: MenoColors.purple.shade900,
      brandSecondary: MenoColors.scarlet.shade200,
      brandSecondaryDark: MenoColors.scarlet.shade400,
      brandSecondaryLight: MenoColors.scarlet.shade900,
      brandSecondaryLighter: MenoColors.scarlet.shade900,
      brandTertiary: MenoColors.yellow.shade200,
      buttonFill: MenoColors.purpleSpecial,
      buttonLabelPrimary: MenoColors.purple.shade800,
      buttonLabelSecondary: MenoColors.purpleSpecial,
      strokeStrong: MenoColors.neutral[0]!,
      strokeSoft: MenoColors.violet.shade400,
      strokeWeak: MenoColors.violet.shade600,
      strokeSub: MenoColors.violet.shade800,
      labelPrimary: MenoColors.neutral[0]!,
      labelHelp: MenoColors.neutral.shade300,
      labelPlaceholder: MenoColors.neutral.shade500,
      labelDisabled: MenoColors.neutral.shade600,
      labelLink: MenoColors.blue.shade400,
      staticBlack: MenoColors.neutral[950]!,
      staticWhite: MenoColors.neutral[0]!,
      errorDark: MenoColors.red.shade100,
      errorBase: MenoColors.red.shade500,
      errorLight: MenoColors.red.shade900,
      errorLighter: MenoColors.red.shade900,
      successDark: MenoColors.green.shade400,
      successBase: MenoColors.green.shade600,
      successLight: MenoColors.green.shade900,
      successLighter: MenoColors.green.shade900,
      infoDark: MenoColors.blue.shade400,
      infoBase: MenoColors.blue.shade300,
      infoLight: MenoColors.blue.shade800,
      infoLighter: MenoColors.blue.shade800,
      warningDark: MenoColors.orange.shade400,
      warningBase: MenoColors.orange.shade600,
      warningLight: MenoColors.orange.shade800,
      warningLighter: MenoColors.orange.shade800,
      pendingDark: MenoColors.yellow.shade400,
      pendingBase: MenoColors.yellow.shade600,
      pendingLight: MenoColors.yellow.shade800,
      pendingLighter: MenoColors.yellow.shade800,
      disabledDark: MenoColors.neutral.shade400,
      disabledBase: MenoColors.neutral.shade600,
      disabledLight: MenoColors.neutral.shade800,
      disabledLighter: MenoColors.neutral.shade800,
      verifiedDark: MenoColors.sky.shade400,
      verifiedBase: MenoColors.sky.shade600,
      verifiedLight: MenoColors.sky.shade900,
      verifiedLighter: MenoColors.sky.shade900,
      notificationDark: MenoColors.red.shade400,
      notificationBase: MenoColors.red.shade500,
      notificationLight: MenoColors.red.shade900,
      notificationLighter: MenoColors.red.shade900,
    );
  }

  @override
  ThemeExtension<MenoColorScheme> copyWith({
    Brightness? brightness,
    Color? backgroundDefault,
    Color? cardPrimary,
    Color? componentPrimary,
    Color? componentSecondary,
    Color? componentWhite,
    Color? sectionPrimary,
    Color? brandPrimary,
    Color? brandPrimaryDark,
    Color? brandPrimaryLight,
    Color? brandPrimaryLighter,
    Color? brandSecondary,
    Color? brandSecondaryDark,
    Color? brandSecondaryLight,
    Color? brandSecondaryLighter,
    Color? brandTertiary,
    Color? buttonFill,
    Color? buttonLabelPrimary,
    Color? buttonLabelSecondary,
    Color? strokeStrong,
    Color? strokeSoft,
    Color? strokeWeak,
    Color? strokeSub,
    Color? labelPrimary,
    Color? labelHelp,
    Color? labelPlaceholder,
    Color? labelDisabled,
    Color? labelLink,
    Color? staticBlack,
    Color? staticWhite,
    Color? errorDark,
    Color? errorBase,
    Color? errorLight,
    Color? errorLighter,
    Color? successDark,
    Color? successBase,
    Color? successLight,
    Color? successLighter,
    Color? infoDark,
    Color? infoBase,
    Color? infoLight,
    Color? infoLighter,
    Color? warningDark,
    Color? warningBase,
    Color? warningLight,
    Color? warningLighter,
    Color? pendingDark,
    Color? pendingBase,
    Color? pendingLight,
    Color? pendingLighter,
    Color? disabledDark,
    Color? disabledBase,
    Color? disabledLight,
    Color? disabledLighter,
    Color? verifiedDark,
    Color? verifiedBase,
    Color? verifiedLight,
    Color? verifiedLighter,
    Color? notificationDark,
    Color? notificationBase,
    Color? notificationLight,
    Color? notificationLighter,
  }) {
    return MenoColorScheme(
      brightness: brightness ?? this.brightness,
      backgroundDefault: backgroundDefault ?? this.backgroundDefault,
      cardPrimary: cardPrimary ?? this.cardPrimary,
      componentPrimary: componentPrimary ?? this.componentPrimary,
      componentSecondary: componentSecondary ?? this.componentSecondary,
      componentWhite: componentWhite ?? this.componentWhite,
      sectionPrimary: sectionPrimary ?? this.sectionPrimary,
      brandPrimary: brandPrimary ?? this.brandPrimary,
      brandPrimaryDark: brandPrimaryDark ?? this.brandPrimaryDark,
      brandPrimaryLight: brandPrimaryLight ?? this.brandPrimaryLight,
      brandPrimaryLighter: brandPrimaryLighter ?? this.brandPrimaryLighter,
      brandSecondary: brandSecondary ?? this.brandSecondary,
      brandSecondaryDark: brandSecondaryDark ?? this.brandSecondaryDark,
      brandSecondaryLight: brandSecondaryLight ?? this.brandSecondaryLight,
      brandSecondaryLighter:
          brandSecondaryLighter ?? this.brandSecondaryLighter,
      brandTertiary: brandTertiary ?? this.brandTertiary,
      buttonFill: buttonFill ?? this.buttonFill,
      buttonLabelPrimary: buttonLabelPrimary ?? this.buttonLabelPrimary,
      buttonLabelSecondary: buttonLabelSecondary ?? this.buttonLabelSecondary,
      strokeStrong: strokeStrong ?? this.strokeStrong,
      strokeSoft: strokeSoft ?? this.strokeSoft,
      strokeWeak: strokeWeak ?? this.strokeWeak,
      strokeSub: strokeSub ?? this.strokeSub,
      labelPrimary: labelPrimary ?? this.labelPrimary,
      labelHelp: labelHelp ?? this.labelHelp,
      labelPlaceholder: labelPlaceholder ?? this.labelPlaceholder,
      labelDisabled: labelDisabled ?? this.labelDisabled,
      labelLink: labelLink ?? this.labelLink,
      staticBlack: staticBlack ?? this.staticBlack,
      staticWhite: staticWhite ?? this.staticWhite,
      errorDark: errorDark ?? this.errorDark,
      errorBase: errorBase ?? this.errorBase,
      errorLight: errorLight ?? this.errorLight,
      errorLighter: errorLighter ?? this.errorLighter,
      successDark: successDark ?? this.successDark,
      successBase: successBase ?? this.successBase,
      successLight: successLight ?? this.successLight,
      successLighter: successLighter ?? this.successLighter,
      infoDark: infoDark ?? this.infoDark,
      infoBase: infoBase ?? this.infoBase,
      infoLight: infoLight ?? this.infoLight,
      infoLighter: infoLighter ?? this.infoLighter,
      warningDark: warningDark ?? this.warningDark,
      warningBase: warningBase ?? this.warningBase,
      warningLight: warningLight ?? this.warningLight,
      warningLighter: warningLighter ?? this.warningLighter,
      pendingDark: pendingDark ?? this.pendingDark,
      pendingBase: pendingBase ?? this.pendingBase,
      pendingLight: pendingLight ?? this.pendingLight,
      pendingLighter: pendingLighter ?? this.pendingLighter,
      disabledDark: disabledDark ?? this.disabledDark,
      disabledBase: disabledBase ?? this.disabledBase,
      disabledLight: disabledLight ?? this.disabledLight,
      disabledLighter: disabledLighter ?? this.disabledLighter,
      verifiedDark: verifiedDark ?? this.verifiedDark,
      verifiedBase: verifiedBase ?? this.verifiedBase,
      verifiedLight: verifiedLight ?? this.verifiedLight,
      verifiedLighter: verifiedLighter ?? this.verifiedLighter,
      notificationDark: notificationDark ?? this.notificationDark,
      notificationBase: notificationBase ?? this.notificationBase,
      notificationLight: notificationLight ?? this.notificationLight,
      notificationLighter: notificationLighter ?? this.notificationLighter,
    );
  }

  /// Brightness of the app
  final Brightness brightness;

  /// Default background color
  final Color backgroundDefault;

  /// Card primary color
  final Color cardPrimary;

  /// Component Primary color
  final Color componentPrimary;

  /// Component Secondary color
  final Color componentSecondary;

  /// Component White color
  final Color componentWhite;

  /// Section Primary color
  final Color sectionPrimary;

  /// Brand Primary color
  final Color brandPrimary;

  /// Brand Primary dark color
  final Color brandPrimaryDark;

  /// Brand Primary light color
  final Color brandPrimaryLight;

  /// Brand Primary lighter color
  final Color brandPrimaryLighter;

  /// Brand Secondary color
  final Color brandSecondary;

  /// Brand Secondary dark color
  final Color brandSecondaryDark;

  /// Brand Secondary light color
  final Color brandSecondaryLight;

  /// Brand Secondary lighter color
  final Color brandSecondaryLighter;

  /// Brand Tertiary color
  final Color brandTertiary;

  /// Button Fill color
  final Color buttonFill;

  /// Button Label Primary color
  final Color buttonLabelPrimary;

  /// Button Label Secondary color
  final Color buttonLabelSecondary;

  /// Strong stroke color
  final Color strokeStrong;

  /// Soft stroke color
  final Color strokeSoft;

  /// Weak stroke color
  final Color strokeWeak;

  /// Sub stroke color
  final Color strokeSub;

  /// Label Primary Color
  final Color labelPrimary;

  /// Label Help Color
  final Color labelHelp;

  /// Label Placeholder Color
  final Color labelPlaceholder;

  /// Label Disabled Color
  final Color labelDisabled;

  /// Label Link Color
  final Color labelLink;

  /// Static Black Color
  final Color staticBlack;

  /// Static White Color
  final Color staticWhite;

  /// Error Dark Color
  final Color errorDark;

  /// Error Base Color
  final Color errorBase;

  /// Error Light Color
  final Color errorLight;

  /// Error Lighter Color
  final Color errorLighter;

  /// Success Dark Color
  final Color successDark;

  /// Success Base Color
  final Color successBase;

  /// Success Light Color
  final Color successLight;

  /// Success Lighter Color
  final Color successLighter;

  /// Information Dark Color
  final Color infoDark;

  /// Information Base Color
  final Color infoBase;

  /// Information Light Color
  final Color infoLight;

  /// Information Lighter Color
  final Color infoLighter;

  /// Warning Dark Color
  final Color warningDark;

  /// Warning Base Color
  final Color warningBase;

  /// Warning Light Color
  final Color warningLight;

  /// Warning Lighter Color
  final Color warningLighter;

  /// Pending Dark Color
  final Color pendingDark;

  /// Pending Base Color
  final Color pendingBase;

  /// Pending Light Color
  final Color pendingLight;

  /// Pending Lighter Color
  final Color pendingLighter;

  /// Disabled Dark Color
  final Color disabledDark;

  /// Disabled Base Color
  final Color disabledBase;

  /// Disabled Light Color
  final Color disabledLight;

  /// Disabled Lighter Color
  final Color disabledLighter;

  /// Verified Dark Color
  final Color verifiedDark;

  /// Verified Base Color
  final Color verifiedBase;

  /// Verified Light Color
  final Color verifiedLight;

  /// Verified Lighter Color
  final Color verifiedLighter;

  /// Notification Dark Color
  final Color notificationDark;

  /// Notification Base Color
  final Color notificationBase;

  /// Notification Light Color
  final Color notificationLight;

  /// Notification Lighter Color
  final Color notificationLighter;

  @override
  ThemeExtension<MenoColorScheme> lerp(
    covariant ThemeExtension<MenoColorScheme>? other,
    double t,
  ) {
    if (other is! MenoColorScheme) return this;

    return MenoColorScheme(
      brightness: other.brightness,
      backgroundDefault:
          Color.lerp(backgroundDefault, other.backgroundDefault, t)!,
      cardPrimary: Color.lerp(cardPrimary, other.cardPrimary, t)!,
      componentPrimary:
          Color.lerp(componentPrimary, other.componentPrimary, t)!,
      componentSecondary:
          Color.lerp(componentSecondary, other.componentSecondary, t)!,
      componentWhite: Color.lerp(componentWhite, other.componentWhite, t)!,
      sectionPrimary: Color.lerp(sectionPrimary, other.sectionPrimary, t)!,
      brandPrimary: Color.lerp(brandPrimary, other.brandPrimary, t)!,
      brandPrimaryDark:
          Color.lerp(brandPrimaryDark, other.brandPrimaryDark, t)!,
      brandPrimaryLight:
          Color.lerp(brandPrimaryLight, other.brandPrimaryLight, t)!,
      brandPrimaryLighter:
          Color.lerp(brandPrimaryLighter, other.brandPrimaryLighter, t)!,
      brandSecondary: Color.lerp(brandSecondary, other.brandSecondary, t)!,
      brandSecondaryDark:
          Color.lerp(brandSecondaryDark, other.brandSecondaryDark, t)!,
      brandSecondaryLight:
          Color.lerp(brandSecondaryLight, other.brandSecondaryLight, t)!,
      brandSecondaryLighter:
          Color.lerp(brandSecondaryLighter, other.brandSecondaryLighter, t)!,
      brandTertiary: Color.lerp(brandTertiary, other.brandTertiary, t)!,
      buttonFill: Color.lerp(buttonFill, other.buttonFill, t)!,
      buttonLabelPrimary:
          Color.lerp(buttonLabelPrimary, other.buttonLabelPrimary, t)!,
      buttonLabelSecondary:
          Color.lerp(buttonLabelSecondary, other.buttonLabelSecondary, t)!,
      strokeStrong: Color.lerp(strokeStrong, other.strokeStrong, t)!,
      strokeSoft: Color.lerp(strokeSoft, other.strokeSoft, t)!,
      strokeWeak: Color.lerp(strokeWeak, other.strokeWeak, t)!,
      strokeSub: Color.lerp(strokeSub, other.strokeSub, t)!,
      labelPrimary: Color.lerp(labelPrimary, other.labelPrimary, t)!,
      labelHelp: Color.lerp(labelHelp, other.labelHelp, t)!,
      labelPlaceholder:
          Color.lerp(labelPlaceholder, other.labelPlaceholder, t)!,
      labelDisabled: Color.lerp(labelDisabled, other.labelDisabled, t)!,
      labelLink: Color.lerp(labelLink, other.labelLink, t)!,
      staticBlack: Color.lerp(staticBlack, other.staticBlack, t)!,
      staticWhite: Color.lerp(staticWhite, other.staticWhite, t)!,
      errorDark: Color.lerp(errorDark, other.errorDark, t)!,
      errorBase: Color.lerp(errorBase, other.errorBase, t)!,
      errorLight: Color.lerp(errorLight, other.errorLight, t)!,
      errorLighter: Color.lerp(errorLighter, other.errorLighter, t)!,
      successDark: Color.lerp(successDark, other.successDark, t)!,
      successBase: Color.lerp(successBase, other.successBase, t)!,
      successLight: Color.lerp(successLight, other.successLight, t)!,
      successLighter: Color.lerp(successLighter, other.successLighter, t)!,
      infoDark: Color.lerp(infoDark, other.infoDark, t)!,
      infoBase: Color.lerp(infoBase, other.infoBase, t)!,
      infoLight: Color.lerp(infoLight, other.infoLight, t)!,
      infoLighter: Color.lerp(infoLighter, other.infoLighter, t)!,
      warningDark: Color.lerp(warningDark, other.warningDark, t)!,
      warningBase: Color.lerp(warningBase, other.warningBase, t)!,
      warningLight: Color.lerp(warningLight, other.warningLight, t)!,
      warningLighter: Color.lerp(warningLighter, other.warningLighter, t)!,
      pendingDark: Color.lerp(pendingDark, other.pendingDark, t)!,
      pendingBase: Color.lerp(pendingBase, other.pendingBase, t)!,
      pendingLight: Color.lerp(pendingLight, other.pendingLight, t)!,
      pendingLighter: Color.lerp(pendingLighter, other.pendingLighter, t)!,
      disabledDark: Color.lerp(disabledDark, other.disabledDark, t)!,
      disabledBase: Color.lerp(disabledBase, other.disabledBase, t)!,
      disabledLight: Color.lerp(disabledLight, other.disabledLight, t)!,
      disabledLighter: Color.lerp(disabledLighter, other.disabledLighter, t)!,
      verifiedDark: Color.lerp(verifiedDark, other.verifiedDark, t)!,
      verifiedBase: Color.lerp(verifiedBase, other.verifiedBase, t)!,
      verifiedLight: Color.lerp(verifiedLight, other.verifiedLight, t)!,
      verifiedLighter: Color.lerp(verifiedLighter, other.verifiedLighter, t)!,
      notificationDark:
          Color.lerp(notificationDark, other.notificationDark, t)!,
      notificationBase:
          Color.lerp(notificationBase, other.notificationBase, t)!,
      notificationLight:
          Color.lerp(notificationLight, other.notificationLight, t)!,
      notificationLighter:
          Color.lerp(notificationLighter, other.notificationLighter, t)!,
    );
  }

  /// Resolves the appropriate value based on the theme brightness.
  ///
  /// This method selects either the light theme value or the dark theme value
  /// based on whether the theme brightness is light or dark.
  ///
  /// - [brightness]: [Brightness] of the app.
  /// - [lightValue]: The value to use for light themes.
  /// - [darkValue]: The value to use for dark themes.
  ///
  /// Returns the appropriate value for the current theme brightness.
  static T _resolve<T>(Brightness brightness, T lightValue, T darkValue) {
    return brightness == Brightness.light ? lightValue : darkValue;
  }

  /// Retrieve the light Material [ColorScheme] for [ThemeData]
  ColorScheme get materialColorScheme {
    return ColorScheme(
      brightness: brightness,
      primary: _resolve(
        brightness,
        MenoColors.purple,
        MenoColors.purple.shade300,
      ),
      onPrimary: _resolve(
        brightness,
        MenoColors.neutral.shade50,
        MenoColors.purple,
      ),
      primaryContainer: _resolve(
        brightness,
        MenoColors.purple.shade100,
        MenoColors.purple.shade400,
      ),
      onPrimaryContainer: _resolve(
        brightness,
        MenoColors.purple.shade700,
        MenoColors.purple.shade50,
      ),
      secondary: _resolve(
        brightness,
        MenoColors.neutral.shade900,
        MenoColors.neutral.shade300,
      ),
      onSecondary: _resolve(
        brightness,
        MenoColors.neutral.shade50,
        MenoColors.neutral.shade900,
      ),
      secondaryContainer: _resolve(
        brightness,
        MenoColors.neutral.shade200,
        MenoColors.neutral.shade900,
      ),
      onSecondaryContainer: _resolve(
        brightness,
        MenoColors.neutral[950],
        MenoColors.neutral.shade100,
      ),
      tertiary: _resolve(
        brightness,
        MenoColors.yellow,
        MenoColors.yellow.shade100,
      ),
      onTertiary: _resolve(
        brightness,
        MenoColors.yellow.shade900,
        MenoColors.yellow.shade900,
      ),
      tertiaryContainer: _resolve(
        brightness,
        MenoColors.blue.shade200,
        MenoColors.blue.shade800,
      ),
      onTertiaryContainer: _resolve(
        brightness,
        MenoColors.blue.shade900,
        MenoColors.blue.shade50,
      ),
      error: _resolve(brightness, MenoColors.red, MenoColors.red.shade100),
      onError: _resolve(
        brightness,
        MenoColors.neutral.shade50,
        MenoColors.red.shade900,
      ),
      errorContainer: _resolve(
        brightness,
        MenoColors.red.shade100,
        MenoColors.red.shade800,
      ),
      onErrorContainer: _resolve(
        brightness,
        MenoColors.red.shade800,
        MenoColors.red.shade50,
      ),
      surface: _resolve(
        brightness,
        MenoColors.neutral[0]!,
        MenoColors.purple[950]!,
      ),
      onSurface: _resolve(
        brightness,
        MenoColors.neutral[950]!,
        MenoColors.neutral.shade50,
      ),
    );
  }

  /// Retrieve the dark Material [ColorScheme] for [ThemeData]
  // ColorScheme get darkMaterialColorScheme {
  //   return ColorScheme(
  //     brightness: brightness,
  // primary: MenoColors.purple.shade300,
  // onPrimary: MenoColors.purple,
  // primaryContainer: MenoColors.purple.shade400,
  // onPrimaryContainer: MenoColors.purple.shade50,
  // secondary: MenoColors.neutral.shade300,
  // onSecondary: MenoColors.neutral.shade900,
  // secondaryContainer: MenoColors.neutral.shade900,
  // onSecondaryContainer: MenoColors.neutral.shade100,
  // tertiary: MenoColors.yellow.shade100,
  // onTertiary: MenoColors.yellow.shade900,
  // tertiaryContainer: MenoColors.blue.shade800,
  // onTertiaryContainer: MenoColors.blue.shade50,
  // error: MenoColors.red.shade100,
  // onError: MenoColors.red.shade900,
  // errorContainer: MenoColors.red.shade800,
  // onErrorContainer: MenoColors.red.shade50,
  // surface: MenoColors.purple[950]!,
  // onSurface: MenoColors.neutral.shade50,
  // );
  // }
}
