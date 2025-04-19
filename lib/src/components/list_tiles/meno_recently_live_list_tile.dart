import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart' show GetTimeAgo;
import 'package:meno_design_system/meno_design_system.dart';

///{@template meno_recently_live_list_tile}
/// A widget that displays a list tile for a recently live stream.
/// It includes the title, creator's name, end time, and an optional image.
///{@endtemplate}
class MenoRecentlyLiveListTile extends StatelessWidget {
  /// Creates a new `MenoRecentlyLiveListTile` widget.
  const MenoRecentlyLiveListTile({
    required this.title,
    required this.creator,
    required this.endTime,
    super.key,
    this.imageUrl,
    this.onTap,
  });

  /// The title of the live stream.
  final String title;

  /// The full name of the broadcast's creator.
  final String creator;

  /// The end time of the live stream.
  final DateTime? endTime;

  /// The URL of the image associated with the live stream.
  final String? imageUrl;

  /// The callback function to be executed when the tile is tapped.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = MenoColorScheme.of(context);

    final formattedEndTime =
        endTime != null ? GetTimeAgo.parse(endTime!) : 'A while back';

    return InkWell(
      onTap: onTap,
      borderRadius: MenoBorderRadius.md,
      child: Padding(
        padding: const EdgeInsets.all(Insets.sm),
        child: Row(
          spacing: Insets.md,
          children: [
            MenoNetworkImage(
              imageUrl,
              key: const Key('MenoRecentlyLiveListTileImage'),
              height: 64,
              width: 79,
              borderRadius: MenoBorderRadius.md,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MenoText.caption(
                    formattedEndTime,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    weight: MenoFontWeight.regular,
                    color: colors.labelPlaceholder,
                  ),
                  const MenoSpacer.v(Insets.xs),
                  MenoText.caption(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  MenoText.caption(
                    creator,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    color: colors.labelPlaceholder,
                    weight: MenoFontWeight.regular,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
