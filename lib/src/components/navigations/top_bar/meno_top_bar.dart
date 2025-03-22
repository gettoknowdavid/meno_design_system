import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:meno_design_system/src/components/navigations/top_bar/base_top_bar.dart';

/// {@template meno_top_bar}
/// Base class for different app bar types.
/// {@endtemplate}
class MenoTopBar extends BaseTopBar {
  /// {@macro meno_top_bar}
  const MenoTopBar._({
    required super.topBarHeight,
    super.title,
    super.titleSize,
    super.key,
    super.backButton,
    super.onBackButtonPressed,
    super.centerTitle = false,
    super.actions,
    super.implyLeading = true,
    super.backLabelText,
    super.leading,
    super.flexibleSpace,
  });

  /// Primary Top Bar
  factory MenoTopBar.primary({
    required String title,
    Key? key,
    String? backLabelText,
    bool implyLeading = false,
    VoidCallback? onBackButtonPressed,
  }) {
    return MenoTopBar._(
      topBarHeight: 120,
      flexibleSpace: _PrimaryTopBar(
        key: key,
        title: title,
        backLabelText: backLabelText,
        implyLeading: implyLeading,
        onBackButtonPressed: onBackButtonPressed,
      ),
    );
  }

  /// Secondary Top Bar
  factory MenoTopBar.secondary({
    required String title,
    Key? key,
    VoidCallback? onBackButtonPressed,
    List<Widget>? actions,
    bool centerTitle = false,
    MenoSize titleSize = MenoSize.md,
  }) {
    return _SecondaryTopBar(
      key: key,
      title: title,
      actions: actions,
      centerTitle: centerTitle,
      onBackButtonPressed: onBackButtonPressed,
      titleSize: titleSize,
    );
  }

  @override
  TopBarStyle defaultStyleOf(BuildContext context) {
    return MenoTopBarTheme.of(context).primary;
  }

  @override
  TopBarStyle? themeStyleOf(BuildContext context) {
    return MenoTopBarTheme.of(context).primary;
  }
}

class _PrimaryTopBar extends StatelessWidget {
  const _PrimaryTopBar({
    required this.title,
    super.key,
    this.implyLeading = false,
    this.backLabelText,
    this.onBackButtonPressed,
  });

  final String title;
  final bool implyLeading;
  final String? backLabelText;
  final VoidCallback? onBackButtonPressed;

  @override
  Widget build(BuildContext context) {
    final style = MenoTopBarTheme.of(context).primary;
    final colorFilter = ColorFilter.mode(style.accentColor!, BlendMode.srcIn);
    final titleTextStyle = style.textStyle?.copyWith(color: style.titleColor);

    return Stack(
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
                    textStyle: Internal.all(style.leadingTextStyle),
                    padding: Internal.all(EdgeInsets.zero),
                    foregroundColor: Internal.all(style.leadingColor),
                  ),
                ),
                const SizedBox(height: Insets.lg),
              ],
              Text(title, style: titleTextStyle),
            ],
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: MenoAssets.images.geometricLines.svg(colorFilter: colorFilter),
        ),
      ],
    );
  }
}

class _SecondaryTopBar extends MenoTopBar {
  _SecondaryTopBar({
    required super.title,
    super.key,
    super.actions,
    super.onBackButtonPressed,
    super.centerTitle,
    super.titleSize,
  }) : super._(
         topBarHeight: 57,
         leading: _SecondaryBackButton(onPressed: onBackButtonPressed),
       );

  @override
  TopBarStyle defaultStyleOf(BuildContext context) {
    return MenoTopBarTheme.of(context).secondary;
  }

  @override
  TopBarStyle? themeStyleOf(BuildContext context) {
    return MenoTopBarTheme.of(context).secondary;
  }
}

class _SecondaryBackButton extends StatelessWidget {
  const _SecondaryBackButton({required this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final style = MenoTopBarTheme.of(context).secondary;
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
        onPressed: onPressed ?? () => Navigator.maybePop(context),
        icon: const Icon(MIcons.chevron_left, size: 26),
        style: IconButton.styleFrom(
          foregroundColor: style.leadingColor,
          maximumSize: const Size(24, 24),
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
