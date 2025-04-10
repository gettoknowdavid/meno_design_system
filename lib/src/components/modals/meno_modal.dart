import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart'
    show MenoColorScheme, MenoModalTitle;

/// A widget that displays a title bar for a modal.
///
/// The [MenoModalTitle] includes a title and an optional close button. It can
/// be used to provide a consistent header for modal dialogs.

class MenoModal extends StatelessWidget {
  /// Creates an instance of [MenoModalTitle].
  ///
  /// The [title] parameter is required. The [showCloseButton] parameter
  /// determines whether a close button is displayed, and defaults to `true`.
  /// The [padding] parameter can be used to add custom padding to the title
  /// bar.

  const MenoModal({
    required this.builder,
    super.key,
    this.title,
    this.showCloseButton = true,
    this.showDivider = true,
    this.padding,
  });

  /// WidgetBuilder for the modal.
  final WidgetBuilder builder;

  /// The title text displayed in the title bar.
  final String? title;

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
    final hasTitle = title != null;
    final effectiveTopPadding =
        hasTitle ? const EdgeInsets.only(top: 48) : EdgeInsets.zero;

    return SafeArea(
      child: Padding(
        padding: MediaQuery.viewInsetsOf(context),
        child: Material(
          color: colors.sectionPrimary,
          child: Padding(
            padding: padding ?? const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  if (hasTitle)
                    Positioned.fill(
                      child: MenoModalTitle(
                        title!,
                        showCloseButton: showCloseButton,
                        showDivider: showDivider,
                      ),
                    ),
                  Padding(
                    padding: effectiveTopPadding,
                    child: builder(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
