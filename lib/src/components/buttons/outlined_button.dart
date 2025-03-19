import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template outlined_button}
/// A custom outlined text button widget that adapts to the platform.
/// {@endtemplate}
class MenoOutlinedButton extends MenoButton {
  /// {@macro outlined_button}
  const MenoOutlinedButton({
    required super.label,
    super.size = MenoSize.md,
    super.onTap,
    super.isLoading = false,
    super.key,
  });

  @override
  Widget buildButton(BuildContext context, Widget child) {
    late final style = MenoButtonTheme.of(context).outlined;
    late final textTheme = MenoTextTheme.of(context);

    late final baseStyle = ButtonHelpers.baseStyles(size, textTheme);
    late final labelPadding = ButtonHelpers.labelPadding(size);
    late final loadingIndicator = ButtonHelpers.loadingIndicator(size);

    return OutlinedButton(
      onPressed: isLoading ? null : onTap,
      style: style.merge(baseStyle),
      child: Padding(
        padding: labelPadding,
        child: isLoading ? loadingIndicator : child,
      ),
    );
  }
}
