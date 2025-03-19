import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template tertiary_button}
/// A custom tertiary text button widget that adapts to the platform.
/// {@endtemplate}
class TertiaryButton extends MenoButton {
  /// {@macro tertiary_button}
  const TertiaryButton({
    required super.label,
    super.size = MenoSize.md,
    super.onTap,
    super.isLoading = false,
    super.key,
  });

  @override
  Widget buildButton(BuildContext context, Widget child) {
    late final style = MenoButtonTheme.of(context).tertiary;
    late final textTheme = MenoTextTheme.of(context);

    late final baseStyle = ButtonHelpers.baseStyles(size, textTheme);
    late final labelPadding = ButtonHelpers.labelPadding(size);
    late final loadingIndicator = ButtonHelpers.loadingIndicator(size);

    return TextButton(
      onPressed: isLoading ? null : onTap,
      style: style.merge(baseStyle),
      child: Padding(
        padding: labelPadding,
        child: isLoading ? loadingIndicator : child,
      ),
    );
  }
}
