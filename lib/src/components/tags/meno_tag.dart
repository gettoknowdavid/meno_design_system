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
    super.borderRadius,
    super.extraText,
    super.showAnimation,
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
  const factory MenoTag.live({
    Key? key,
    MenoSize size,
    MenoTagStyle style,
    String? extraText,
    bool showAnimation,
  }) = _LiveTag;

  /// Off-Air
  const factory MenoTag.offAir({
    Key? key,
    MenoSize size,
    MenoTagStyle style,
    String? extraText,
    bool showAnimation,
  }) = _OffAirTag;

  /// Reconnecting
  const factory MenoTag.reconnecting({
    Key? key,
    MenoSize size,
    MenoTagStyle style,
    String? extraText,
    bool showAnimation,
  }) = _Reconnecting;

  /// Waiting
  const factory MenoTag.waiting({
    Key? key,
    MenoSize size,
    MenoTagStyle style,
    String? extraText,
    bool showAnimation,
  }) = _WaitingTag;

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
  }) : super._(
         status: MenoTagStatus.inProgress,
         borderRadius: MenoBorderRadius.circle,
       );
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
  const _LiveTag({
    super.key,
    super.size = MenoSize.lg,
    super.style = MenoTagStyle.filled,
    super.extraText,
    super.showAnimation,
  }) : super._(
         'LIVE',
         status: MenoTagStatus.live,
         borderRadius: MenoBorderRadius.circle,
       );
}

class _Reconnecting extends MenoTag {
  const _Reconnecting({
    super.key,
    super.size = MenoSize.lg,
    super.style = MenoTagStyle.filled,
    super.extraText,
    super.showAnimation,
  }) : super._(
         'RECONNECTING',
         status: MenoTagStatus.reconnecting,
         borderRadius: MenoBorderRadius.circle,
       );
}

class _OffAirTag extends MenoTag {
  const _OffAirTag({
    super.key,
    super.size = MenoSize.lg,
    super.style = MenoTagStyle.filled,
    super.extraText,
    super.showAnimation,
  }) : super._(
         'OFF AIR',
         status: MenoTagStatus.offAir,
         borderRadius: MenoBorderRadius.circle,
       );
}

class _WaitingTag extends MenoTag {
  const _WaitingTag({
    super.key,
    super.size = MenoSize.lg,
    super.style = MenoTagStyle.filled,
    super.extraText,
    super.showAnimation,
  }) : super._(
         'WAITING',
         status: MenoTagStatus.waiting,
         borderRadius: MenoBorderRadius.circle,
       );
}

class _PendingTag extends MenoTag {
  const _PendingTag(
    super.label, {
    super.key,
    super.size = MenoSize.lg,
    super.style = MenoTagStyle.filled,
  }) : super._(
         status: MenoTagStatus.pending,
         borderRadius: MenoBorderRadius.circle,
       );
}

class _DisabledTag extends MenoTag {
  const _DisabledTag(
    super.label, {
    super.key,
    super.size = MenoSize.lg,
    super.style = MenoTagStyle.filled,
  }) : super._(status: MenoTagStatus.disabled);
}
