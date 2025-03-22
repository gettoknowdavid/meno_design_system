import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template secondary_top_bar}
/// The secondary top bar
/// {@endtemplate}
class SecondaryTopBar extends StatelessWidget {
  /// {@macro secondary_top_bar}
  const SecondaryTopBar(
    this.title, {
    super.key,
    this.titleSize = TopBarTitleSize.normal,
    this.onBackButtonPressed,
    this.actions,
    this.centerTitle = false,
  });

  /// Title of the top bar
  final String title;

  /// Size of the top bar title
  final TopBarTitleSize titleSize;

  /// The callback action of the back button
  final VoidCallback? onBackButtonPressed;

  /// The actions at the end of the top bar
  final List<Widget>? actions;

  /// If the title is to appear in the center
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    final theme = MenoTopBarTheme.of(context).secondary;
    final textTheme = MenoTextTheme.of(context);

    late final titleTextStyle = switch (titleSize) {
      TopBarTitleSize.large => textTheme.heading3Medium,
      _ => theme.textStyle,
    };

    return AppBar(
      backgroundColor: theme.backgroundColor,
      foregroundColor: theme.titleColor,
      titleTextStyle: titleTextStyle,
      actionsIconTheme: IconThemeData(color: theme.actionColor),
      titleSpacing: Insets.xs,
      leadingWidth: 40,
      shape: theme.bottomBorder,
      leading: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          onPressed: onBackButtonPressed ?? () => Navigator.maybePop(context),
          icon: const Icon(MIcons.chevron_left, size: 26),
          style: IconButton.styleFrom(
            foregroundColor: theme.leadingColor,
            maximumSize: const Size(24, 24),
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
          ),
        ),
      ),
      title: Text(title),
      centerTitle: centerTitle,
      actionsPadding: const EdgeInsets.only(right: Insets.lg),
      actions: actions,
    );
  }
}
