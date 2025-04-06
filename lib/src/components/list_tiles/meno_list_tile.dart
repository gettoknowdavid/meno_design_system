import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_list_tile}
/// A custom list tile used across the Meno app for standardized display.
///
/// This widget is a subclass of [_BaseListTile] that supports different
/// visual sizes and presets like `small` and `large`.
///
/// Use [MenoListTile.small] for compact list tiles,
/// [MenoListTile.large] for more detailed tiles with overline and subtitle,
/// or use the default constructor for medium size tiles.
/// {@endtemplate}
class MenoListTile extends _BaseListTile {
  /// Creates a medium-sized [MenoListTile] with default padding and size.
  const MenoListTile({
    required super.headline,
    super.key,
    super.leading,
    super.trailing,
    super.iconColor,
    super.headlineColor,
    super.subtitle,
    super.overline,
    super.onTap,
    super.contentPadding,
    super.enabled,
    super.isThreeLine,
    super.selected,
  }) : super(size: MenoSize.md);

  /// Internal named constructor used by factory constructors to override
  /// certain properties like size, padding, etc.
  const MenoListTile._({
    required super.headline,
    super.key,
    super.leading,
    super.trailing,
    super.iconColor,
    super.headlineColor,
    super.subtitle,
    super.overline,
    super.size,
    super.onTap,
    super.contentPadding,
    super.enabled,
    super.isThreeLine,
    super.selected,
  });

  /// {@template meno_list_tile.small}
  /// Creates a compact, small-sized [MenoListTile] with reduced padding.
  ///
  /// Ideal for condensed UI sections like popups or modals.
  /// {@endtemplate}
  const factory MenoListTile.small({
    required String headline,
    Key? key,
    Widget? leading,
    Widget? trailing,
    Color? iconColor,
    Color? headlineColor,
    VoidCallback? onTap,
    bool enabled,
    bool selected,
  }) = _SmallListTile;

  /// {@template meno_list_tile.large}
  /// Creates a large-sized [MenoListTile] with overline and subtitle.
  ///
  /// Best suited for rich content display like user profiles or messages.
  /// {@endtemplate}
  const factory MenoListTile.large({
    required String headline,
    required String subtitle,
    required String overline,
    Key? key,
    Widget? leading,
    Widget? trailing,
    Color? iconColor,
    Color? headlineColor,
    VoidCallback? onTap,
    bool enabled,
    bool selected,
  }) = _LargeListTile;
}

/// Internal implementation of [MenoListTile.small].
///
/// Applies smaller size and tighter padding.
class _SmallListTile extends MenoListTile {
  const _SmallListTile({
    required super.headline,
    super.key,
    super.leading,
    super.trailing,
    super.iconColor,
    super.headlineColor,
    super.onTap,
    super.enabled = true,
    super.selected = false,
  }) : super._(
         size: MenoSize.sm,
         contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
       );
}

/// Internal implementation of [MenoListTile.large].
///
/// Applies larger size and enables three-line layout.
class _LargeListTile extends MenoListTile {
  const _LargeListTile({
    required super.headline,
    super.key,
    super.leading,
    super.trailing,
    super.iconColor,
    super.headlineColor,
    super.overline,
    super.subtitle,
    super.onTap,
    super.enabled = true,
    super.selected = false,
  }) : super._(size: MenoSize.lg, isThreeLine: true);
}

/// A base class that all [MenoListTile] variations extend from.
///
/// Handles the core layout using Flutter's [ListTile] and provides
/// consistent styling and layout behavior for all variations.
class _BaseListTile extends StatelessWidget {
  /// {@macro base_list_tile}
  const _BaseListTile({
    required this.headline,
    this.leading,
    this.trailing,
    this.subtitle,
    this.overline,
    this.iconColor,
    this.headlineColor,
    this.selected = false,
    this.enabled = true,
    this.onTap,
    super.key,
    this.contentPadding = const EdgeInsets.fromLTRB(16, 12, 24, 12),
    this.isThreeLine = false,
    this.size = MenoSize.md,
  });

  /// Primary text displayed in the tile.
  final String headline;

  /// Optional leading widget (e.g., icon or avatar).
  final Widget? leading;

  /// Optional trailing widget (e.g., arrow or button).
  final Widget? trailing;

  /// Secondary text shown below the headline.
  final String? subtitle;

  /// Overline text displayed above the headline (used in large tiles).
  final String? overline;

  /// Color for the leading icon.
  final Color? iconColor;

  /// Color for the headline text.
  final Color? headlineColor;

  /// Whether the tile is visually selected.
  final bool selected;

  /// Whether the tile is interactive.
  final bool enabled;

  /// Called when the tile is tapped.
  final VoidCallback? onTap;

  /// Controls the internal padding of the tile.
  final EdgeInsetsGeometry contentPadding;

  /// Enables three-line layout (overline + headline + subtitle).
  final bool isThreeLine;

  /// Visual size of the tile (small, medium, large).
  final MenoSize size;

  @override
  Widget build(BuildContext context) {
    final colors = MenoColorScheme.of(context);

    return ListTile(
      contentPadding: contentPadding,
      horizontalTitleGap: 16,
      minVerticalPadding: Insets.sm,
      leading: leading,
      iconColor: iconColor ?? colors.brandPrimary,
      textColor: headlineColor,
      title: _Title(headline, overline: overline, size: size),
      subtitle: subtitle == null ? null : _Subtitle(subtitle: subtitle!),
      isThreeLine: isThreeLine,
      trailing: trailing,
      selectedColor: colors.brandPrimary,
      selected: selected,
      onTap: onTap,
      enabled: enabled,
    );
  }
}

/// A text widget that shows the subtitle beneath the headline.
///
/// Applies secondary style from the Meno design system.
class _Subtitle extends StatelessWidget {
  const _Subtitle({required this.subtitle});

  /// Subtitle text to display.
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return MenoText.caption(
      subtitle,
      color: MenoColorScheme.of(context).labelPlaceholder,
      maxLines: 3,
      weight: MenoFontWeight.regular,
    );
  }
}

/// Handles rendering of the tile's title section based on the size.
///
/// For large tiles, it includes both overline and headline.
/// For others, just the headline is shown.
class _Title extends StatelessWidget {
  const _Title(this.headline, {required this.size, this.overline});

  final String headline;
  final String? overline;
  final MenoSize size;

  @override
  Widget build(BuildContext context) {
    return switch (size) {
      MenoSize.lg => _LargeTitle(headline, overline: overline!),
      MenoSize.md => MenoText.body(headline, weight: MenoFontWeight.regular),
      _ => MenoText.body(headline),
    };
  }
}

/// Displays both the overline and headline for large list tiles.
class _LargeTitle extends StatelessWidget {
  const _LargeTitle(this.headline, {required this.overline});

  /// Overline text (e.g., category or label).
  final String overline;

  /// Main headline of the tile.
  final String headline;

  @override
  Widget build(BuildContext context) {
    final colors = MenoColorScheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MenoText.micro(overline, color: colors.labelHelp),
        MenoText.body(headline, weight: MenoFontWeight.regular),
      ],
    );
  }
}
