// 
// ignore_for_file: require_trailing_commas

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
    this.enabled = true,
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

  /// Whether the image is enabled or not.
  final bool enabled;

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
    }, [hasBorder, borderColor, colors]);

    final radiusValue = radius ?? menoRadius.value;
    final diameter = radiusValue * 2;

    final child = useMemoized(() {
      if (isLoading) return _Skeleton(radius: radiusValue);

      if (!isLoading && file == null && url != null) {
        return _CachedUrlImage(url: url, radius: radiusValue, enabled: enabled);
      }

      if (!isLoading && file != null) {
        return CircleAvatar(
          radius: radiusValue,
          foregroundImage: FileImage(file!),
        );
      }

      return _Placeholder(
        radius: radiusValue,
        menoRadius: menoRadius,
        enabled: enabled,
      );
    }, [isLoading, file, url, enabled, radiusValue, menoRadius, colors]);

    return SizedBox.square(
      dimension: diameter,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: MenoBorderRadius.circle,
        child: Stack(children: [child, resolvedBorder]),
      ),
    );
  }
}

class _CachedUrlImage extends StatelessWidget {
  const _CachedUrlImage({
    required this.url,
    required this.radius,
    this.enabled = true,
  });

  final String? url;
  final double radius;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final diameter = radius * 2;
    return Opacity(
      opacity: enabled ? 1.0 : 0.6,
      child: CachedNetworkImage(
        imageUrl: url!,
        imageBuilder: (_, image) => CircleAvatar(foregroundImage: image),
        progressIndicatorBuilder: (__, url, _) => _Skeleton(radius: radius),
        height: diameter,
        width: diameter,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({
    this.menoRadius = MenoAvatarRadius.xxlg,
    this.radius,
    this.enabled = true,
  });

  final MenoAvatarRadius menoRadius;
  final double? radius;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = MenoColorScheme.of(context);
    final iconSize = radius != null ? radius! * 0.7 : menoRadius.iconSize;
    return Opacity(
      opacity: enabled ? 1.0 : 0.6,
      child: Skeleton.unite(
        child: CircleAvatar(
          radius: radius ?? menoRadius.value,
          backgroundColor: colors.componentSecondary,
          child: Icon(
            MIcons.user,
            color: colors.labelPlaceholder,
            size: iconSize,
          ),
        ),
      ),
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
