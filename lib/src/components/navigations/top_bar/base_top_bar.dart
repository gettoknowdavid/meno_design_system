import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template base_meno_top_bar}
/// The BaseHeader
/// {@endtemplate}
abstract class BaseTopBar extends StatelessWidget
    implements PreferredSizeWidget {
  /// {@macro base_meno_top_bar}
  const BaseTopBar({
    required this.topBarHeight,
    this.title,
    this.titleSize = MenoSize.md,
    this.centerTitle = false,
    this.implyLeading = false,
    super.key,
    this.backButton,
    this.backLabelText,
    this.onBackButtonPressed,
    this.actions,
    this.flexibleSpace,
    this.leading,
  });

  /// The title of the top bar
  final String? title;

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

  /// If the leading widget should be shown
  final bool implyLeading;

  /// The [MenoSize]
  final MenoSize titleSize;

  /// Height of the header
  final double topBarHeight;

  /// Custom widget can be added via this `flexibleSpace`
  final Widget? flexibleSpace;

  /// Custom widget can be added via this `leading`
  final Widget? leading;

  /// The default styling of the header
  @protected
  TopBarStyle defaultStyleOf(BuildContext context);

  /// Returns the TopBarStyle that belongs to the top bar's component theme
  @protected
  TopBarStyle? themeStyleOf(BuildContext context);

  @override
  Size get preferredSize => Size.fromHeight(topBarHeight);

  @override
  Widget build(BuildContext context) {
    final themeStyle = themeStyleOf(context);
    final defaultStyle = defaultStyleOf(context);

    T? effectiveValue<T>(T? Function(TopBarStyle? style) getProperty) {
      final themeValue = getProperty(themeStyle);
      final defaultValue = getProperty(defaultStyle);
      return themeValue ?? defaultValue;
    }

    T? resolve<T>(T? Function(TopBarStyle? style) getProperty) {
      return effectiveValue((TopBarStyle? style) => getProperty(style));
    }

    final backgroundColor = resolve<Color?>((s) => s?.backgroundColor);
    final titleColor = resolve<Color?>((s) => s?.titleColor);
    final actionColor = resolve<Color?>((s) => s?.actionColor);
    final leadingColor = resolve<Color?>((s) => s?.leadingColor);
    final bottomBorder = resolve<ShapeBorder?>((s) => s?.bottomBorder);
    final leadingWidth = resolve<double?>((s) => s?.leadingWidth);
    final titleSpacing = resolve<double?>((s) => s?.titleSpacing);

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      foregroundColor: titleColor,
      titleTextStyle: _titleTextStyle(context),
      toolbarHeight: topBarHeight,
      flexibleSpace: flexibleSpace,
      leadingWidth: leadingWidth,
      titleSpacing: titleSpacing,
      shape: bottomBorder,
      actions: actions,
      actionsIconTheme: IconThemeData(color: actionColor),
      actionsPadding: const EdgeInsets.only(right: Insets.lg),
      title: title != null ? Text(title!) : null,
      centerTitle: centerTitle,
      leading:
          leading != null
              ? IconTheme(
                data: IconThemeData(size: 26, color: leadingColor),
                child: leading!,
              )
              : null,
    );
  }

  TextStyle? _titleTextStyle(BuildContext context) {
    final textTheme = MenoTextTheme.of(context);
    return switch (titleSize) {
      MenoSize.lg => textTheme.heading3Medium,
      _ => textTheme.bodyBold,
    };
  }
}
