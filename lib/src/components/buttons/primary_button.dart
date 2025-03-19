import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template primary_button}
/// A custom primary text button widget that adapts to the platform.
/// {@endtemplate}
class PrimaryButton extends MenoButton {
  /// {@macro primary_button}
  const PrimaryButton({
    required super.label,
    super.size = MenoSize.md,
    super.onTap,
    super.isLoading = false,
    super.key,
  });

  /// Creates an instance of [PrimaryButton] with an icon.
  ///
  /// Parameters:
  /// - [label]: The text label of the button.
  /// - [icon]: The icon to be displayed in the button.
  /// - [onTap]: The callback function to be invoked when the button is
  /// pressed.
  /// - [iconAlignment]: Specifies where the icon should be placed relative to
  /// the text. Defaults to [IconAlignment.start].
  /// - [isLoading]: Indicates whether the button is in a loading state.
  /// Defaults to false.
  /// - [style]: An optional button style to customize the appearance.
  const PrimaryButton.icon({
    required super.label,
    required super.icon,
    required super.onTap,
    super.key,
    super.size = MenoSize.md,
    super.iconAlignment = IconAlignment.start,
    super.isLoading,
    super.style,
  }) : super.icon();

  @override
  Widget buildButton(BuildContext context, Widget child) {
    late final style = MenoButtonTheme.of(context).primary;
    late final textTheme = MenoTextTheme.of(context);

    late final baseStyle = ButtonHelpers.baseStyles(size, textTheme);
    late final labelPadding = ButtonHelpers.labelPadding(size);
    late final loadingIndicator = ButtonHelpers.loadingIndicator(size);

    return FilledButton(
      onPressed: isLoading ? null : onTap,
      style: style.merge(baseStyle),
      child: Padding(
        padding: labelPadding,
        child: isLoading ? loadingIndicator : child,
      ),
    );
  }
}
