
import 'package:cached_network_image/cached_network_image.dart' show CachedNetworkImage;
import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// {@template meno_network_image}
/// A custom implementation of an image component with a [CachedNetworkImage]
/// {@endtemplate}
class MenoNetworkImage extends StatelessWidget {
  /// {@macro meno_network_image}
  const MenoNetworkImage(
    this.imageUrl, {
    super.key,
    this.height = double.infinity,
    this.width = double.infinity,
    this.borderRadius = MenoBorderRadius.sm,
    this.placeholderIconSize = 24,
  });

  /// The URL link of the image to be displayed
  final String? imageUrl;

  /// The height of the image
  final double height;

  /// The width of the image
  final double width;

  /// The corner radius of the image container
  final BorderRadiusGeometry borderRadius;

  /// The size of the icon for the placeholder
  final double placeholderIconSize;

  @override
  Widget build(BuildContext context) {
    final colors = MenoColorScheme.of(context);
    final decoration = BoxDecoration(
      borderRadius: borderRadius,
      color: colors.componentSecondary,
    );

    Widget child = DecoratedBox(
      decoration: decoration,
      child: Icon(
        MIcons.image,
        size: placeholderIconSize,
        color: colors.labelPlaceholder,
      ),
    );

    if (imageUrl != null) {
      child = CachedNetworkImage(
        imageUrl: imageUrl!,
        imageBuilder: (context, image) {
          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              image: DecorationImage(image: image, fit: BoxFit.cover),
            ),
          );
        },
        progressIndicatorBuilder: (__, url, _) {
          return Skeletonizer(child: DecoratedBox(decoration: decoration));
        },
      );
    }

    return Skeleton.unite(
      child: SizedBox(height: height, width: width, child: child),
    );
  }
}
