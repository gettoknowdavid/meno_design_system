import 'package:flutter/material.dart';
import 'package:meno_design_system/src/components/navigations/top_bar/primary_top_bar.dart';
import 'package:meno_design_system/src/components/navigations/top_bar/secondary_top_bar.dart';

/// Enum representing different types of app bars.
enum TopBarType {
  /// Large top bar
  primary,

  /// Small sized top bar
  secondary,
}

/// Enum representing the different sizes of the app bar's title
enum TopBarTitleSize {
  /// The default size
  normal,

  /// The large size
  large,
}

/// {@template meno_top_bar}
/// Base class for different app bar types.
/// {@endtemplate}
class MenoTopBar extends StatelessWidget implements PreferredSizeWidget {
  /// {@macro meno_top_bar}
  const MenoTopBar({
    required this.title,
    required this.type,
    super.key,
    this.backButton,
    this.onBackButtonPressed,
    this.centerTitle = false,
    this.actions,
    this.implyLeading = true,
    this.backLabelText,
    this.titleSize = TopBarTitleSize.normal,
  });

  /// The title of the top bar
  final String title;

  /// Custom back button
  final Widget? backButton;

  /// Custom label text for back button
  final String? backLabelText;

  /// Custom callback to set what happens when a user taps the back button
  final VoidCallback? onBackButtonPressed;

  /// Whether to center the title.
  final bool centerTitle;

  /// A list of widgets to display on the right side of the app bar.
  final List<Widget>? actions;

  /// The type of the top bar.
  final TopBarType type;

  /// The size of the top bar's title.
  ///
  /// Only applicable to the `secondary` [TopBarType]
  final TopBarTitleSize titleSize;

  /// If the leading widget should be shown
  final bool implyLeading;

  @override
  Widget build(BuildContext context) => switch (type) {
    TopBarType.primary => PrimaryTopBar(
      title,
      onBackButtonPressed: onBackButtonPressed,
      implyLeading: implyLeading,
      backLabelText: backLabelText,
    ),
    TopBarType.secondary => SecondaryTopBar(
      title,
      titleSize: titleSize,
      onBackButtonPressed: onBackButtonPressed,
      actions: actions,
      centerTitle: centerTitle,
    ),
  };

  @override
  Size get preferredSize => switch (type) {
    TopBarType.primary => const Size.fromHeight(120),
    _ => const Size.fromHeight(56),
  };
}
