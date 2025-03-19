import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template button_helpers}
/// A helper class containing helpers functions for all button types
/// {@endtemplate}
class ButtonHelpers {
  const ButtonHelpers._();

  /// Gets base button height based on the [MenoSize]: `size`
  static double buttonHeight(MenoSize size) => switch (size) {
    MenoSize.xs => 24.0,
    MenoSize.sm => 32.0,
    MenoSize.md => 40.0,
    MenoSize.lg => 48.0,
  };

  /// Gets base button [Padding] based on the [MenoSize]: `size`
  static EdgeInsetsGeometry buttonPadding(MenoSize size) => switch (size) {
    MenoSize.xs => const EdgeInsets.symmetric(horizontal: Insets.sm),
    MenoSize.sm => const EdgeInsets.symmetric(horizontal: Insets.lg),
    MenoSize.md => const EdgeInsets.symmetric(horizontal: Insets.lg),
    MenoSize.lg => const EdgeInsets.symmetric(horizontal: Insets.xlg),
  };

  /// Gets base button's label [Padding] based on the [MenoSize]: `size`
  static EdgeInsetsGeometry labelPadding(MenoSize size) => switch (size) {
    MenoSize.xs => const EdgeInsets.symmetric(horizontal: Insets.xs),
    MenoSize.sm => const EdgeInsets.symmetric(horizontal: Insets.sm),
    MenoSize.md => const EdgeInsets.symmetric(horizontal: Insets.sm),
    MenoSize.lg => const EdgeInsets.symmetric(horizontal: Insets.md),
  };

  /// Gets base button's [BorderRadius] based on the [MenoSize]: `size`
  static BorderRadius borderRadius(MenoSize size) => switch (size) {
    MenoSize.xs => const BorderRadius.all(MenoRadius.xs),
    MenoSize.sm => const BorderRadius.all(MenoRadius.sm),
    MenoSize.md => const BorderRadius.all(MenoRadius.sm),
    MenoSize.lg => const BorderRadius.all(MenoRadius.md),
  };

  /// Gets base button's label [TextStyle] based on the [MenoSize]: `size`
  static TextStyle textStyle(MenoSize size, MenoTextTheme textTheme) {
    return switch (size) {
      MenoSize.xs => textTheme.nanoMedium,
      MenoSize.sm => textTheme.microMedium,
      MenoSize.md => textTheme.captionMedium,
      MenoSize.lg => textTheme.bodyMedium,
    };
  }

  /// Gets base button's [MenoLoadingIndicator] based on the [MenoSize]: `size`
  static MenoLoadingIndicator loadingIndicator(MenoSize size) {
    return switch (size) {
      MenoSize.xs => const MenoLoadingIndicator.xs(),
      MenoSize.sm => const MenoLoadingIndicator.sm(),
      MenoSize.md => const MenoLoadingIndicator.md(),
      MenoSize.lg => const MenoLoadingIndicator.lg(),
    };
  }

  /// Gets the base [ButtonStyle]
  static ButtonStyle baseStyles(MenoSize size, MenoTextTheme textTheme) {
    late final borderRadius = ButtonHelpers.borderRadius(size);
    late final buttonPadding = ButtonHelpers.labelPadding(size);
    late final textStyle = ButtonHelpers.textStyle(size, textTheme);

    return ButtonStyle(
      padding: WidgetStatePropertyAll(buttonPadding),
      textStyle: WidgetStatePropertyAll(textStyle),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: borderRadius),
      ),
    );
  }
}
