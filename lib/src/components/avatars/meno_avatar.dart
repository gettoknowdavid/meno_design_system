import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meno_design_system/meno_design_system.dart'
    show MIcons, MenoAvatarRadius, MenoBorderRadius, MenoColorScheme;
import 'package:skeletonizer/skeletonizer.dart';

/// {@template meno_avatar}
/// A custom implementation of an avatar.
/// {@endtemplate}
class MenoAvatar extends HookWidget {
  /// {@macro meno_avatar}
  const MenoAvatar({
    super.key,
    this.menoRadius = MenoAvatarRadius.xxlg,
    this.radius,
    this.url,
    this.file,
    this.onTap,
    this.hasBorder = false,
    this.isLoading = false,
    this.borderColor,
  });

  /// The radius of the avatar.
  ///
  /// This determines the size of the circular avatar.
  final MenoAvatarRadius menoRadius;

  /// Optional radius value to set desired radius
  final double? radius;

  /// The URL of the background image for the avatar.
  ///
  /// If provided, this URL will be used to fetch and display an image in the
  /// avatar.
  final String? url;

  /// The local file for the background image of the avatar.
  ///
  /// If provided, this file will be used to display a local image in the
  /// avatar.
  final File? file;

  /// A callback function to be called when the avatar is tapped.
  ///
  /// If provided, this function will be invoked when the user taps on the
  /// avatar.
  final VoidCallback? onTap;

  /// Whether the avatar should have a border around it.
  ///
  /// If true, a border will be added around the avatar. Defaults to false.
  final bool hasBorder;

  /// Color of the border
  final Color? borderColor;

  /// Flag for when the image is being loaded from the url
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final colors = MenoColorScheme.of(context);

    final resolvedBorder = useMemoized(() {
      if (!hasBorder) return const SizedBox.shrink();
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: borderColor ?? colors.backgroundDefault,
          ),
        ),
      );
    });

    final radiusValue = radius ?? menoRadius.value;
    final diameter = radiusValue * 2;

    final child = useMemoized(() {
      if (isLoading) return _Skeleton(radius: radiusValue);
      return Stack(
        children: [
          if (!isLoading && file == null && url != null)
            _CachedUrlImage(url: url, radius: radiusValue)
          else if (!isLoading && file != null)
            CircleAvatar(radius: radiusValue, backgroundImage: FileImage(file!))
          else
            _Placeholder(radius: radiusValue, iconSize: menoRadius.iconSize),
          resolvedBorder,
        ],
      );
    });

    return SizedBox.square(
      dimension: diameter,
      child: InkWell(
        onTap: onTap,
        borderRadius: MenoBorderRadius.circle,
        child: child,
      ),
    );
  }
}

class _CachedUrlImage extends StatelessWidget {
  const _CachedUrlImage({required this.url, required this.radius});

  final String? url;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final diameter = radius * 2;
    return CachedNetworkImage(
      imageUrl: url!,
      imageBuilder: (_, image) => CircleAvatar(foregroundImage: image),
      progressIndicatorBuilder: (context, url, _) => _Skeleton(radius: radius),
      height: diameter,
      width: diameter,
      fit: BoxFit.cover,
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.radius, required this.iconSize});

  final double radius;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final colors = MenoColorScheme.of(context);
    return CircleAvatar(
      radius: radius,
      backgroundColor: colors.componentSecondary,
      child: Icon(MIcons.user, color: colors.labelPlaceholder, size: iconSize),
    );
  }
}

class _Skeleton extends StatelessWidget {
  const _Skeleton({required this.radius});

  final double radius;

  @override
  Widget build(BuildContext context) {
    final colors = MenoColorScheme.of(context);
    return Skeletonizer(
      child: Skeleton.unite(
        child: CircleAvatar(
          radius: radius,
          backgroundColor: colors.backgroundDefault,
        ),
      ),
    );
  }
}
