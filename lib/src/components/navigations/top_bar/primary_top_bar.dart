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
    final style = MenoTopBarTheme.of(context).primary;

    final colorFilter = ColorFilter.mode(style.accentColor!, BlendMode.srcIn);

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: style.backgroundColor,
      foregroundColor: style.titleColor,
      titleTextStyle: style.textStyle,
      toolbarHeight: style.topbarHeight,
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
                  // TertiaryButton.icon(
                  //   label: backLabelText ?? 'Back',
                  //   icon: const Icon(Icons.chevron_left),
                  //   onTap: onBackButtonPressed,
                  //   size: MenoSize.xs,
                  //   forcedHeight: 18,
                  //   style: ButtonStyle(
                  //     textStyle: Internal.all(style.leadingTextStyle),
                  //     padding: Internal.all(EdgeInsets.zero),
                  //     foregroundColor: Internal.resolveWith(
                  //       style.leadingColor!,
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: Insets.lg),
                ],
                Text(
                  title,
                  style: style.textStyle?.copyWith(color: style.titleColor),
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
