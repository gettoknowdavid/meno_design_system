import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// {@macro meno_tag_status}
enum MenoTagStatus {
  /// inProgress
  inProgress,

  /// approved
  approved,

  /// live
  live,

  /// pending
  pending,

  /// disabled
  disabled,
}

/// {@macro meno_tag_style}
enum MenoTagStyle {
  /// filled
  filled,

  /// outlined
  outlined,
}

/// {@template base_tag}
/// Custom implementation for a Tag
/// {@endtemplate}
class BaseTag extends StatefulWidget {
  /// {@macro base_tag}
  const BaseTag(
    this.label, {
    super.key,
    this.size = MenoSize.md,
    this.status = MenoTagStatus.inProgress,
    this.style = MenoTagStyle.filled,
  });

  /// Label
  final String label;

  /// [MenoSize]
  final MenoSize size;

  /// [MenoTagStatus]
  final MenoTagStatus status;

  /// [MenoTagStyle]
  final MenoTagStyle style;

  @override
  State<BaseTag> createState() => _BaseTagState();
}

class _BaseTagState extends State<BaseTag> {
  @override
  Widget build(BuildContext context) {
    final colors = MenoColorScheme.of(context);

    final isFilled = widget.style == MenoTagStyle.filled;

    final backgroundColor = _backgroundColor(colors);
    final foregroundColor = _foregroundColor(colors);

    final height = _height;
    final padding = _padding;
    final textStyle = _textStyle.copyWith(color: foregroundColor);

    return Skeleton.unite(
      child: Container(
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: isFilled ? backgroundColor : null,
          border: Border.all(
            color: isFilled ? backgroundColor : foregroundColor,
          ),
          borderRadius: MenoBorderRadius.xs,
        ),
        child: Text(widget.label, style: textStyle),
      ),
    );
  }

  double get _height => switch (widget.size) {
    MenoSize.lg => 24.0,
    MenoSize.md => 20.0,
    _ => 16.0,
  };

  EdgeInsetsGeometry get _padding => switch (widget.size) {
    MenoSize.lg => const EdgeInsets.fromLTRB(8, 3, 8, 3),
    MenoSize.md => const EdgeInsets.fromLTRB(8, 1.5, 8, 1.5),
    _ => const EdgeInsets.fromLTRB(8, 0, 8, 0),
  };

  TextStyle get _textStyle => switch (widget.size) {
    MenoSize.lg => MenoTextStyles.captionMedium,
    _ => MenoTextStyles.microMedium,
  };

  Color _backgroundColor(MenoColorScheme colors) => switch (widget.status) {
    MenoTagStatus.approved => colors.successLighter,
    MenoTagStatus.disabled => colors.disabledLighter,
    MenoTagStatus.inProgress => colors.verifiedLighter,
    MenoTagStatus.live => colors.errorLighter,
    MenoTagStatus.pending => colors.pendingLighter,
  };

  Color _foregroundColor(MenoColorScheme colors) => switch (widget.status) {
    MenoTagStatus.approved => colors.successBase,
    MenoTagStatus.disabled => colors.disabledBase,
    MenoTagStatus.inProgress => colors.verifiedBase,
    MenoTagStatus.live => colors.errorBase,
    MenoTagStatus.pending => colors.pendingBase,
  };
}
