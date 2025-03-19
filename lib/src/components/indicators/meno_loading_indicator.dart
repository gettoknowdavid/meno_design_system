import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_loading_indicator}
/// A custom loading indicator
/// {@endtemplate}
class MenoLoadingIndicator extends StatelessWidget {
  /// {@macro meno_loading_indicator}
  const MenoLoadingIndicator._({
    required this.size,
    super.key,
    this.height,
    this.width,
    this.isBox = false,
  });

  /// Creates an instance of [MenoLoadingIndicator] with a predefined size of
  /// `height: 24` and `width: 32`.
  const MenoLoadingIndicator.xs({Key? key, bool isBox = false})
    : this._(size: MenoSize.xs, key: key, isBox: isBox);

  /// Creates an instance of [MenoLoadingIndicator] with a predefined size of
  /// `height: 32` and `width: 48`.
  const MenoLoadingIndicator.sm({Key? key, bool isBox = false})
    : this._(size: MenoSize.sm, key: key, isBox: isBox);

  /// Creates an instance of [MenoLoadingIndicator] with a predefined size of
  /// `height: 40` and `width: 56`.
  const MenoLoadingIndicator.md({Key? key, bool isBox = false})
    : this._(size: MenoSize.md, key: key, isBox: isBox);

  /// Creates an instance of [MenoLoadingIndicator] with a predefined size of
  /// `height: 48` and `width: 72`.
  const MenoLoadingIndicator.lg({Key? key, bool isBox = false})
    : this._(size: MenoSize.lg, key: key, isBox: isBox);

  /// Height of the indicator
  final double? height;

  /// Width of the indicator
  final double? width;

  /// Meno size
  final MenoSize size;

  /// Flag to set the same dimensions for height and width
  final bool isBox;

  @override
  Widget build(BuildContext context) {
    final effectiveHeight =
        height ??
        switch (size) {
          MenoSize.xs => 24.0,
          MenoSize.sm => 32.0,
          MenoSize.md => 40.0,
          MenoSize.lg => 48.0,
        };

    final effectiveWidth =
        width ??
        switch (size) {
          MenoSize.xs => 32.0,
          MenoSize.sm => 48.0,
          MenoSize.md => 56.0,
          MenoSize.lg => 72.0,
        };

    return SizedBox(
      height: effectiveHeight,
      width: isBox ? effectiveHeight : effectiveWidth,
      child: MenoAssets.gifs.loading.image(
        fit: BoxFit.cover,
        height: height ?? effectiveHeight,
        width: isBox ? effectiveHeight : effectiveWidth,
      ),
    );
  }
}
