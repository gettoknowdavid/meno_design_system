import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_base_button}
/// A custom text button widget that adapts to the platform.
/// {@endtemplate}
class BaseButton extends StatelessWidget {
  /// {@macro meno_base_button}
  const BaseButton({
    required this.label,
    required this.size,
    super.key,
    this.isLoading = false,
    this.disabled = false,
    this.addLabelPadding = false,
  });

  /// The button's label
  final String label;

  /// The size of the button
  ///
  /// [MenoSize.xs] - Mciro
  /// [MenoSize.sm] - Small
  /// [MenoSize.md] - Medium
  /// [MenoSize.lg] - Large
  ///
  /// The default is [MenoSize.md]
  final MenoSize size;

  /// Flag to set the loading state of the button. Shows the
  /// [MenoLoadingIndicator] widget
  final bool isLoading;

  /// Flag to set the button to the disabled state
  final bool disabled;

  /// Flag to add or remove the padding on the label
  final bool addLabelPadding;

  @override
  Widget build(BuildContext context) {
    if (isLoading) return MenoLoadingIndicatorBySize(size);
    return _Label(label: label, size: size, addPadding: addLabelPadding);
  }

  /// Gets base button's [BorderRadius] based on the [MenoSize]: `size`
  static WidgetStateProperty<OutlinedBorder>? border(MenoSize size) {
    return switch (size) {
      MenoSize.xs => const WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: MenoBorderRadius.xs),
      ),
      MenoSize.sm => const WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: MenoBorderRadius.sm),
      ),
      MenoSize.md => const WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: MenoBorderRadius.sm),
      ),
      MenoSize.lg => const WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: MenoBorderRadius.md),
      ),
    };
  }

  /// Calculates the minimum size of the button based on the [MenoSize] of the
  /// button.
  static WidgetStateProperty<double>? iconSize(MenoSize size) {
    return switch (size) {
      MenoSize.xs => const WidgetStatePropertyAll(14),
      MenoSize.sm => const WidgetStatePropertyAll(14),
      MenoSize.md => const WidgetStatePropertyAll(18),
      MenoSize.lg => const WidgetStatePropertyAll(20),
    };
  }

  /// Calculates the maximum size of the button based on the [MenoSize] of the
  /// button.
  static WidgetStateProperty<Size>? maximumSize(MenoSize size) {
    return switch (size) {
      MenoSize.xs => const WidgetStatePropertyAll(Size(double.infinity, 24)),
      MenoSize.sm => const WidgetStatePropertyAll(Size(double.infinity, 32)),
      MenoSize.md => const WidgetStatePropertyAll(Size(double.infinity, 40)),
      MenoSize.lg => const WidgetStatePropertyAll(Size(double.infinity, 48)),
    };
  }

  /// Calculates the minimum size of the button based on the [MenoSize] of the
  /// button.
  static WidgetStateProperty<Size>? minimumSize(MenoSize size) {
    return switch (size) {
      MenoSize.xs => const WidgetStatePropertyAll(Size(0, 24)),
      MenoSize.sm => const WidgetStatePropertyAll(Size(0, 32)),
      MenoSize.md => const WidgetStatePropertyAll(Size(0, 40)),
      MenoSize.lg => const WidgetStatePropertyAll(Size(0, 48)),
    };
  }

  /// Gets the button padding based on the [MenoSize] of the button
  static WidgetStatePropertyAll<EdgeInsetsGeometry>? padding(MenoSize size) {
    return switch (size) {
      MenoSize.xs => const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: Insets.sm),
      ),
      MenoSize.sm => const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: Insets.lg),
      ),
      MenoSize.md => const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: Insets.lg),
      ),
      MenoSize.lg => const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: Insets.xlg),
      ),
    };
  }

  /// Gets base button's label [TextStyle] based on the [MenoSize]: `size`
  static WidgetStatePropertyAll<TextStyle?> textStyle(
    MenoSize size,
    BuildContext context,
  ) {
    final textTheme = MenoTextTheme.of(context);
    return switch (size) {
      MenoSize.xs => WidgetStatePropertyAll(textTheme.nanoMedium),
      MenoSize.sm => WidgetStatePropertyAll(textTheme.microMedium),
      MenoSize.md => WidgetStatePropertyAll(textTheme.captionMedium),
      MenoSize.lg => WidgetStatePropertyAll(textTheme.bodyMedium),
    };
  }
}

/// {@template meno_base_button}
/// A custom text button widget with icon that adapts to the platform.
/// {@endtemplate}
class BaseButtonWithIcon extends StatelessWidget {
  /// {@macro meno_base_button}
  const BaseButtonWithIcon({
    required this.label,
    required this.icon,
    required this.style,
    required this.iconAlignment,
    required this.size,
    this.isLoading = false,
    super.key,
  });

  /// Button label
  final Widget label;

  /// Button icon
  final Widget icon;

  /// Button style
  final ButtonStyle? style;

  /// Placement of icon
  final IconAlignment? iconAlignment;

  /// Size of the button
  final MenoSize size;

  /// Loading state of the button
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) return MenoLoadingIndicatorBySize(size);

    final textStyle = BaseButton.textStyle(size, context);
    final fontSize = textStyle.resolve(const <WidgetState>{})?.fontSize ?? 14.0;
    final x = MediaQuery.textScalerOf(context).scale(fontSize) / 14.0;
    final scale = clampDouble(x, 1, 2) - 1.0;

    // Adjust the gap based on the text scale factor. Start at 8, and lerp
    // to 4 based on how large the text is.
    final gapWidth = lerpDouble(8, 4, scale)!;
    final gap = SizedBox(width: gapWidth);

    final effectiveIconAlignment =
        iconAlignment ?? style?.iconAlignment ?? IconAlignment.start;
    final isStart = effectiveIconAlignment == IconAlignment.start;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isStart) ...[icon, gap, Flexible(child: label)],
        if (!isStart) ...[Flexible(child: label), gap, icon],
      ],
    );
  }
}

class _Label extends StatelessWidget {
  const _Label({
    required this.label,
    required this.size,
    this.addPadding = false,
  });

  final String label;
  final MenoSize size;
  final bool addPadding;

  @override
  Widget build(BuildContext context) {
    late final labelPadding = switch (size) {
      MenoSize.xs => const EdgeInsets.symmetric(horizontal: Insets.xs),
      MenoSize.sm => const EdgeInsets.symmetric(horizontal: Insets.sm),
      MenoSize.md => const EdgeInsets.symmetric(horizontal: Insets.sm),
      MenoSize.lg => const EdgeInsets.symmetric(horizontal: Insets.md),
    };

    return Padding(
      padding: addPadding ? labelPadding : EdgeInsets.zero,
      child: Text(label),
    );
  }
}
