import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template white_button}
/// A custom white text button widget that adapts to the platform.
/// {@endtemplate}
class WhiteButton extends MenoButton {
  /// {@macro white_button}
  const WhiteButton({
    required super.label,
    super.size = MenoSize.md,
    super.onTap,
    super.isLoading = false,
    super.key,
  });

  @override
  Widget buildButton(BuildContext context, Widget child) {
    late final style = MenoButtonTheme.of(context).white;
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
