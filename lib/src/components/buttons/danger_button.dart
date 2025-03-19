import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// Enum to distingush the `normal` [DangerButton] from the `lighter` one
enum DangerVariant {
  /// [DangerButton] with default error color
  normal,

  /// [DangerButton] with lighter error color
  lighter,
}

/// {@template danger_button}
/// A custom danger button widget that adapts to the platform.
/// {@endtemplate}
class DangerButton extends MenoButton {
  /// {@macro danger_button}
  const DangerButton({
    required super.label,
    super.size = MenoSize.md,
    super.onTap,
    super.isLoading = false,
    super.key,
    this.variant = DangerVariant.normal,
  });

  /// Enum to distingush the `normal` [DangerButton] from the `lighter` one
  final DangerVariant variant;

  @override
  Widget buildButton(BuildContext context, Widget child) {
    late final style = switch (variant) {
      DangerVariant.normal => MenoButtonTheme.of(context).danger,
      DangerVariant.lighter => MenoButtonTheme.of(context).dangerLighter,
    };

    late final textTheme = MenoTextTheme.of(context);

    late final baseStyle = ButtonHelpers.baseStyles(size, textTheme);
    late final labelPadding = ButtonHelpers.labelPadding(size);
    late final loadingIndicator = ButtonHelpers.loadingIndicator(size);

    return ElevatedButton(
      onPressed: isLoading ? null : onTap,
      style: style.merge(baseStyle),
      child: Padding(
        padding: labelPadding,
        child: isLoading ? loadingIndicator : child,
      ),
    );
  }
}
