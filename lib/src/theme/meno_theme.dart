import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:meno_design_system/src/theme/meno_tab_bar_theme.dart';

/// {@template meno_theme}
/// Configuration class which collects all Themes of app together and provides
/// them as a single instance
/// {@endtemplate}
class MenoTheme extends ThemeExtension<MenoTheme> {
  /// {@macro meno_theme}
  const MenoTheme({
    required this.colors,
    required this.textTheme,
    required this.buttonTheme,
    required this.inputTheme,
    required this.topBarTheme,
    required this.headerTheme,
    required this.snackbarTheme,
    required this.navigationBarTheme,
    required this.tabBarTheme,
  });

  /// Retrieves the [MenoTheme] extension from the closest [Theme] instance
  /// that encloses the given [context].
  ///
  /// This method searches for the nearest [Theme] widget in the widget tree
  /// and returns the [MenoTheme] extension if it exists. If no
  /// [MenoTheme] extension is found, this method returns null.
  ///
  /// The [MenoTheme] extension must be added to the [ThemeData.extensions]
  /// in your theme configuration to be accessible using this method.
  ///
  /// Example usage:
  /// ```dart
  /// final MenoTheme = MenoTheme.of(context);
  /// ```
  ///
  /// - [context]: The build context from which to retrieve the [MenoTheme]
  /// extension.
  ///
  /// Returns the [MenoTheme] extension if found, or null if no
  /// [MenoTheme] extension is available in the closest [Theme] instance.
  factory MenoTheme.of(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final defaultTheme = MenoTheme.$default(brightness);
    return Theme.of(context).extension<MenoTheme>() ?? defaultTheme;
  }

  /// {@macro meno_theme}
  factory MenoTheme.$default(Brightness brightness) {
    final colors = MenoColorScheme.$default(brightness);
    final textTheme = MenoTextTheme.$default(colors);
    final buttonTheme = MenoButtonTheme.$default(colors);
    final inputTheme = MenoInputTheme.$default(colors, textTheme);
    final topBarTheme = MenoTopBarTheme.$default(colors, textTheme);
    final headerTheme = MenoHeaderTheme.$default(colors, textTheme);
    final snackbarTheme = MenoSnackbarTheme.$default(colors);
    final navigationBarTheme = MenoNavigationBarTheme.$default(colors);
    final tabBarTheme = MenoTabBarTheme.$default(colors);

    return MenoTheme(
      colors: colors,
      textTheme: textTheme,
      buttonTheme: buttonTheme,
      inputTheme: inputTheme,
      topBarTheme: topBarTheme,
      headerTheme: headerTheme,
      snackbarTheme: snackbarTheme,
      navigationBarTheme: navigationBarTheme,
      tabBarTheme: tabBarTheme,
    );
  }

  /// Retrieves the light [ThemeData]
  static ThemeData get light => _raw(Brightness.light);

  /// Retrieves the dark [ThemeData]
  static ThemeData get dark => _raw(Brightness.dark);

  /// {@macro meno_theme}
  static ThemeData _raw(Brightness brightness) {
    final colors = MenoColorScheme.$default(brightness);
    final snackbar = MenoSnackbarTheme.$default(colors);
    final themeExtension = MenoTheme.$default(brightness);
    final textTheme = MenoTextTheme.$default(colors);
    final navigationBarTheme = MenoNavigationBarTheme.$default(colors);

    return ThemeData(
      appBarTheme: const AppBarTheme(elevation: 0, scrolledUnderElevation: 0),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.sectionPrimary,
        dragHandleColor: colors.labelPlaceholder,
        modalBackgroundColor: colors.sectionPrimary,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
      ),
      brightness: brightness,
      colorScheme: colors.materialColorScheme,
      checkboxTheme: CheckboxThemeData(
        checkColor: Internal.all(colors.buttonLabelPrimary),
        fillColor: Internal.resolveWith(
          Colors.transparent,
          selected: colors.buttonFill,
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const RoundedRectangleBorder(borderRadius: MenoBorderRadius.xs),
        side: BorderSide(color: colors.strokeSoft),
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      ),
      dividerTheme: DividerThemeData(
        color: colors.strokeSoft,
        thickness: 1,
        space: 0,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(padding: Internal.all(EdgeInsets.zero)),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: navigationBarTheme.backgroundColor,
        elevation: 0,
        iconTheme: navigationBarTheme.iconTheme,
        indicatorColor: navigationBarTheme.selectedColor,
        labelTextStyle: navigationBarTheme.labelTextStyle,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        height: 56,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: colors.brandPrimary,
        borderRadius: const BorderRadius.all(Radius.circular(2)),
        circularTrackColor: colors.brandPrimaryLighter,
        linearMinHeight: 4,
        linearTrackColor: colors.brandPrimaryLighter,
      ),
      searchBarTheme: SearchBarThemeData(
        constraints: BoxConstraints.tight(const Size.fromHeight(40)),
        padding: Internal.all(
          const EdgeInsets.symmetric(horizontal: Insets.md),
        ),
        hintStyle: Internal.all(
          textTheme.captionRegular.copyWith(color: colors.labelPlaceholder),
        ),
        shape: Internal.all(
          const RoundedRectangleBorder(borderRadius: MenoBorderRadius.sm),
        ),
        side: WidgetStateProperty.resolveWith((states) {
          final side = BorderSide(color: colors.strokeSoft);
          if (states.contains(WidgetState.error)) {
            return side.copyWith(color: colors.errorBase, width: 2);
          } else if (states.contains(WidgetState.disabled)) {
            return side.copyWith(color: colors.disabledLight);
          } else if (states.contains(WidgetState.focused)) {
            return side.copyWith(color: colors.brandPrimary, width: 2);
          } else if (states.contains(WidgetState.selected)) {
            return side.copyWith(color: colors.brandPrimary, width: 2);
          }
          return side;
        }),
        textStyle: WidgetStateTextStyle.resolveWith((states) {
          final baseTextStyle = textTheme.captionRegular;
          late Color color;
          if (states.contains(WidgetState.disabled)) {
            color = colors.labelDisabled;
          } else if (states.contains(WidgetState.focused)) {
            color = colors.labelPrimary;
          } else if (states.contains(WidgetState.error)) {
            color = colors.labelPrimary;
          } else {
            color = colors.labelPlaceholder;
          }
          return baseTextStyle.copyWith(color: color);
        }),
      ),
      snackBarTheme: SnackBarThemeData(
        actionBackgroundColor: Colors.transparent,
        actionTextColor: snackbar.foregroundColor,
        backgroundColor: snackbar.backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: MenoBorderRadius.sm),
        contentTextStyle: snackbar.textStyle.copyWith(
          color: snackbar.foregroundColor,
        ),
        elevation: snackbar.elevation,
        insetPadding: snackbar.insetPadding,
      ),
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      extensions: [themeExtension],
    );
  }

  @override
  ThemeExtension<MenoTheme> copyWith({
    ThemeExtension<MenoColorScheme>? colors,
    ThemeExtension<MenoTextTheme>? textTheme,
    ThemeExtension<MenoButtonTheme>? buttonTheme,
    ThemeExtension<MenoInputTheme>? inputTheme,
    ThemeExtension<MenoTopBarTheme>? topBarTheme,
    ThemeExtension<MenoHeaderTheme>? headerTheme,
    ThemeExtension<MenoSnackbarTheme>? snackbarTheme,
    ThemeExtension<MenoNavigationBarTheme>? navigationBarTheme,
    ThemeExtension<MenoTabBarTheme>? tabBarTheme,
  }) {
    return MenoTheme(
      colors: colors ?? this.colors,
      textTheme: textTheme ?? this.textTheme,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      inputTheme: inputTheme ?? this.inputTheme,
      topBarTheme: topBarTheme ?? this.topBarTheme,
      headerTheme: headerTheme ?? this.headerTheme,
      snackbarTheme: snackbarTheme ?? this.snackbarTheme,
      navigationBarTheme: navigationBarTheme ?? this.navigationBarTheme,
      tabBarTheme: tabBarTheme ?? this.tabBarTheme,
    );
  }

  /// [MenoColorScheme] instance provides configuration of [ColorScheme]
  final ThemeExtension<MenoColorScheme> colors;

  /// [MenoTextTheme] instance provides configuration of [TextTheme]
  final ThemeExtension<MenoTextTheme> textTheme;

  /// [MenoButtonTheme] instance provides configuration for buttons
  final ThemeExtension<MenoButtonTheme> buttonTheme;

  /// [MenoInputTheme] instance provides configuration for input fields
  final ThemeExtension<MenoInputTheme> inputTheme;

  /// [MenoTopBarTheme] instance provides configuration for [AppBar]s
  final ThemeExtension<MenoTopBarTheme> topBarTheme;

  /// [MenoHeaderTheme] instance provides configuration for [AppBar]s
  final ThemeExtension<MenoHeaderTheme> headerTheme;

  /// [MenoSnackbarTheme] instance provides configuration for [SnackBar]s
  final ThemeExtension<MenoSnackbarTheme> snackbarTheme;

  /// [MenoNavigationBarTheme] for Navigation bars
  final ThemeExtension<MenoNavigationBarTheme> navigationBarTheme;

  /// [MenoTabBarTheme] for Tab bars
  final ThemeExtension<MenoTabBarTheme> tabBarTheme;

  @override
  ThemeExtension<MenoTheme> lerp(
    covariant ThemeExtension<MenoTheme>? other,
    double t,
  ) {
    if (other is! MenoTheme) return this;
    return MenoTheme(
      colors: colors.lerp(other.colors, t),
      textTheme: textTheme.lerp(other.textTheme, t),
      buttonTheme: buttonTheme.lerp(other.buttonTheme, t),
      inputTheme: inputTheme.lerp(other.inputTheme, t),
      topBarTheme: topBarTheme.lerp(other.topBarTheme, t),
      headerTheme: headerTheme.lerp(other.headerTheme, t),
      snackbarTheme: snackbarTheme.lerp(other.snackbarTheme, t),
      navigationBarTheme: navigationBarTheme.lerp(other.navigationBarTheme, t),
      tabBarTheme: tabBarTheme.lerp(other.tabBarTheme, t),
    );
  }
}
