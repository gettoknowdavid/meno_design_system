import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart'
    show MenoAssets, MenoColorScheme;

/// A placeholder widget that displays a logo based on the theme.
///
/// This widget is useful for displaying a placeholder image while content is
/// loading.
class MenoPlaceholder extends StatelessWidget {
  /// Creates a new `MenoPlaceholder` widget.
  ///
  /// * `dimension`: The size of the placeholder. If null, the placeholder
  /// will adapt to its parent's size.
  const MenoPlaceholder({super.key, this.dimension});

  /// The size of the placeholder.
  final double? dimension;

  @override
  Widget build(BuildContext context) {
    final colors = MenoColorScheme.of(context);
    final isDark = colors.brightness == Brightness.dark;
    final filter = ColorFilter.mode(colors.disabledBase, BlendMode.srcIn);

    Widget child = MenoAssets.images.logo.logoDark.svg(colorFilter: filter);

    if (isDark) {
      child = MenoAssets.images.logo.logoLight.svg(colorFilter: filter);
    }

    return Center(child: SizedBox.square(dimension: dimension, child: child));
  }
}
