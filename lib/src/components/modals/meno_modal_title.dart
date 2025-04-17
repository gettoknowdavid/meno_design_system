import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// A widget that displays a title bar for a modal.
///
/// The [MenoModalTitle] includes a title and an optional close button.
/// It can be used to provide a consistent header for modal dialogs.
///
/// Example usage:
/// ```dart
/// MenoModalTitle(
///   title: 'Modal Title',
///   showCloseButton: true,
///   padding: EdgeInsets.all(16.0),
/// );
/// ```
class MenoModalTitle extends StatelessWidget {
  /// Creates an instance of [MenoModalTitle].
  ///
  /// The [title] parameter is required. The [showCloseButton] parameter
  /// determines whether a close button is displayed, and defaults to `true`.
  /// The [padding] parameter can be used to add custom padding to the title
  /// bar.
  const MenoModalTitle(
    this.title, {
    super.key,
    this.showCloseButton = true,
    this.showDivider = true,
    this.padding,
  });

  /// The title text displayed in the title bar.
  final String title;

  /// Determines whether the close button is displayed.
  ///
  /// Defaults to `true`.
  final bool showCloseButton;

  /// Determines whether the divider at the bottom of the title is displayed.
  ///
  /// Defaults to `true`.
  final bool showDivider;

  /// Custom padding for the title bar.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final colors = MenoColorScheme.of(context);
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MenoText.subheading(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              if (showCloseButton)
                MenoIconButton(
                  MIcons.x_close,
                  onPressed: () => Navigator.pop(context),
                  color: colors.labelPlaceholder,
                  semanticLabel: 'Close modal button',
                ),
            ],
          ),
          if (showDivider) ...[const MenoSpacer.v(Insets.sm), const Divider()],
        ],
      ),
    );
  }
}
