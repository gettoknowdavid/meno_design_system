import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:meno_design_system/src/components/tags/base_tag.dart';

/// {@template meno_tag}
/// Custom implementation for a Tag
/// {@endtemplate}
class MenoTag extends BaseTag {
  const MenoTag._(
    super.label, {
    super.key,
    super.size,
    super.status,
    super.style,
  });

  /// In Progress
  const factory MenoTag.inProgress(
    String label, {
    Key? key,
    MenoSize size,
    MenoTagStyle style,
  }) = _InProgressTag;

  /// Approved
  const factory MenoTag.approved(
    String label, {
    Key? key,
    MenoSize size,
    MenoTagStyle style,
  }) = _ApprovedTag;

  /// Live
  const factory MenoTag.live(
    String label, {
    Key? key,
    MenoSize size,
    MenoTagStyle style,
  }) = _LiveTag;

  /// Pending
  const factory MenoTag.pending(
    String label, {
    Key? key,
    MenoSize size,
    MenoTagStyle style,
  }) = _PendingTag;

  /// Disabled
  const factory MenoTag.disabled(
    String label, {
    Key? key,
    MenoSize size,
    MenoTagStyle style,
  }) = _DisabledTag;
}

class _InProgressTag extends MenoTag {
  const _InProgressTag(
    super.label, {
    super.key,
    super.size = MenoSize.lg,
    super.style = MenoTagStyle.filled,
  }) : super._(status: MenoTagStatus.inProgress);
}

class _ApprovedTag extends MenoTag {
  const _ApprovedTag(
    super.label, {
    super.key,
    super.size = MenoSize.lg,
    super.style = MenoTagStyle.filled,
  }) : super._(status: MenoTagStatus.approved);
}

class _LiveTag extends MenoTag {
  const _LiveTag(
    super.label, {
    super.key,
    super.size = MenoSize.lg,
    super.style = MenoTagStyle.filled,
  }) : super._(status: MenoTagStatus.live);
}

class _PendingTag extends MenoTag {
  const _PendingTag(
    super.label, {
    super.key,
    super.size = MenoSize.lg,
    super.style = MenoTagStyle.filled,
  }) : super._(status: MenoTagStatus.pending);
}

class _DisabledTag extends MenoTag {
  const _DisabledTag(
    super.label, {
    super.key,
    super.size = MenoSize.lg,
    super.style = MenoTagStyle.filled,
  }) : super._(status: MenoTagStatus.disabled);
}
