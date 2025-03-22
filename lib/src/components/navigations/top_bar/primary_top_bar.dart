import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template primary_top_bar}
/// The primary top bar
/// {@endtemplate}
class PrimaryTopBar extends StatelessWidget {
  /// {@macro primary_top_bar}
  const PrimaryTopBar(
    this.title, {
    super.key,
    this.backLabelText,
    this.onBackButtonPressed,
    this.implyLeading = true,
  });

  /// Top bar title
  final String title;

  /// The text of the back button labal
  final String? backLabelText;

  /// The call back action of the back button
  final VoidCallback? onBackButtonPressed;

  /// If the back button should be visible
  final bool implyLeading;

  @override
  Widget build(BuildContext context) {
    final theme = MenoTopBarTheme.of(context).primary;

    final colorFilter = ColorFilter.mode(theme.accentColor!, BlendMode.srcIn);

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: theme.backgroundColor,
      foregroundColor: theme.titleColor,
      titleTextStyle: theme.textStyle,
      toolbarHeight: theme.topbarHeight,
      flexibleSpace: Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.centerLeft,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Insets.lg),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (implyLeading) ...[
                  MenoTertiaryButton.icon(
                    label: Text(backLabelText ?? 'Back'),
                    icon: const Icon(MIcons.chevron_left),
                    onPressed: onBackButtonPressed,
                    size: MenoSize.xs,
                    style: ButtonStyle(
                      textStyle: Internal.all(theme.leadingTextStyle),
                      padding: Internal.all(EdgeInsets.zero),
                      foregroundColor: Internal.all(theme.leadingColor),
                    ),
                  ),
                  const SizedBox(height: Insets.lg),
                ],
                Text(
                  title,
                  style: theme.textStyle?.copyWith(color: theme.titleColor),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: MenoAssets.images.geometricLines.svg(
              colorFilter: colorFilter,
            ),
          ),
        ],
      ),
    );
  }
}
