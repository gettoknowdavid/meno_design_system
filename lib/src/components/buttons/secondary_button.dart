import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template secondary_button}
/// A custom secondary text button widget that adapts to the platform.
/// {@endtemplate}
class SecondaryButton extends MenoButton {
  /// {@macro secondary_button}
  const SecondaryButton({
    required super.label,
    super.size = MenoSize.md,
    super.onTap,
    super.isLoading = false,
    super.key,
  });

  @override
  Widget buildButton(BuildContext context, Widget child) {
    late final style = MenoButtonTheme.of(context).secondary;
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
