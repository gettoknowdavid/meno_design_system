import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// A widget that displays a character counter for an input field.
///
/// This widget shows the current length of the input and the maximum allowed
/// length. It is typically used to provide feedback on how many characters the
/// user has entered in relation to the maximum allowed length.
///
/// To use this widget, pass the maximum length and the current length of the
/// input. Optionally, you can also specify if the counter should be enabled
/// or not.
///
/// Example usage:
/// ```dart
/// MenoInputCounter(
///   maxLength: 100,
///   currentLength: 45,
/// );
/// ```
class MenoInputCounter extends StatelessWidget {
  /// Creates an instance of [MenoInputCounter].
  ///
  /// Parameters:
  /// - [maxLength]: The maximum number of characters allowed.
  /// - [currentLength]: The current number of characters entered.
  /// - [key]: An optional key to identify the widget.
  /// - [enabled]: A boolean indicating whether the counter is enabled.
  /// Defaults to true.
  const MenoInputCounter({
    required this.maxLength,
    required this.currentLength,
    super.key,
    this.enabled = true,
  });

  /// The maximum number of characters allowed.
  final int maxLength;

  /// The current number of characters entered.
  final int currentLength;

  /// A boolean indicating whether the counter is enabled. Defaults to true.
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = MenoInputTheme.of(context);
    final textTheme = MenoTextTheme.of(context);
    final textColor =
        enabled ? theme.counterFocusedColor : theme.counterDisabledColor;
    final containerColor =
        enabled
            ? theme.counterContainerFocusedColor
            : theme.counterContainerDisabledColor;
    return Container(
      constraints: const BoxConstraints(minWidth: 49, maxHeight: 24),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: Insets.sm,
        vertical: Insets.xs,
      ),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: MenoBorderRadius.xs,
      ),
      child: Text(
        '$currentLength/$maxLength',
        textAlign: TextAlign.center,
        style: textTheme.microMedium.copyWith(color: textColor),
      ),
    );
  }
}
