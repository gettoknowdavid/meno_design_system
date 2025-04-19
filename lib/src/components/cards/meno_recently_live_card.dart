import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

///{@template meno_recently_live_list_tile}
/// A widget that displays a card for a recently live stream.
///{@endtemplate}
class MenoRecentlyLiveCard extends StatelessWidget {
  /// Creates a new `MenoRecentlyLiveCard` widget.
  const MenoRecentlyLiveCard({
    required this.title,
    required this.creator,
    this.imageUrl,
    this.onTap,
    super.key,
  });

  /// The title of the live stream.
  final String title;

  /// The full name of the broadcast's creator.
  final String creator;

  /// The URL of the image associated with the live stream.
  final String? imageUrl;

  /// The callback function to be executed when the tile is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = MenoColorScheme.of(context);
    const borderRadius = MenoBorderRadius.lg;
    return InkWell(
      borderRadius: borderRadius,
      child: Card(
        margin: EdgeInsets.zero,
        color: colors.cardPrimary,
        shape: const RoundedRectangleBorder(borderRadius: borderRadius),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: SizedBox.square(
            dimension: 148,
            child: Column(
              children: [
                MenoNetworkImage(
                  imageUrl,
                  key: const Key('RecentlyLiveBroadcastCardImage'),
                  height: 88,
                ),
                const MenoSpacer.v(Insets.md),
                MenoText.caption(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const MenoSpacer.v(Insets.xs),
                MenoText.caption(
                  creator,
                  color: colors.labelPlaceholder,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  weight: MenoFontWeight.regular,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
