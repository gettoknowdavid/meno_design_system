import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';
import 'package:meno_design_system/src/components/navigations/header/base_header.dart';

/// {@template meno_header}
/// The Meno Heder
/// {@endtemplate}
class MenoHeader extends BaseHeader {
  const MenoHeader._({
    required super.title,
    required super.headerHeight,
    super.label,
    super.actions,
    super.actionCallback,
    super.actionLabel,
    super.size,
    super.key,
  });

  /// Primary Meno Header
  factory MenoHeader.primary({
    required Widget title,
    required String label,
    List<Widget>? actions,
  }) {
    return MenoHeader._(
      title: title,
      label: label,
      actions: actions,
      headerHeight: 56,
    );
  }

  /// Primary Meno Header for Large Layouts
  factory MenoHeader.primaryLarge({
    required Widget title,
    required String label,
    List<Widget>? actions,
  }) {
    return _PrimaryHeaderLarge(
      title: title,
      label: label,
      actions: actions,
      headerHeight: 88,
    );
  }

  /// Secondary Meno Header
  factory MenoHeader.secondary({
    required Widget title,
    MenoSize size = MenoSize.md,
    String? actionLabel,
    VoidCallback? actionCallback,
  }) {
    return _SecondaryHeader(
      size: size,
      title: title,
      actionCallback: actionCallback,
      actionLabel: actionLabel,
    );
  }

  /// Secondary Meno Header for Large layouts
  factory MenoHeader.secondaryLarge({
    required Widget title,
    List<Widget>? actions,
  }) {
    return _SecondaryHeaderLarge(title: title, actions: actions);
  }

  @override
  HeaderStyle defaultStyleOf(BuildContext context) {
    return MenoHeaderTheme.of(context).primary;
  }

  @override
  HeaderStyle? themeStyleOf(BuildContext context) {
    return MenoHeaderTheme.of(context).primary;
  }
}

class _PrimaryHeaderLarge extends MenoHeader {
  const _PrimaryHeaderLarge({
    required super.title,
    required super.label,
    required super.headerHeight,
    super.actions,
  }) : super._();

  @override
  HeaderStyle themeStyleOf(BuildContext context) {
    final style = MenoHeaderTheme.of(context).primary;
    return style.copyWith(
      titleEndGap: Insets.lg,
      actionsSpacing: Insets.xxlg,
      padding: const EdgeInsets.fromLTRB(40, 32, 40, 16),
    );
  }
}

class _SecondaryHeader extends MenoHeader {
  _SecondaryHeader({
    required super.size,
    required super.title,
    super.actionCallback,
    super.actionLabel,
  }) : super._(headerHeight: _headerHeight(size));

  static double _headerHeight(MenoSize size) {
    return switch (size) {
      MenoSize.md => 30,
      MenoSize.lg => 36,
      _ => 24,
    };
  }

  @override
  HeaderStyle themeStyleOf(BuildContext context) {
    final style = MenoHeaderTheme.of(context).secondary;
    final textTheme = MenoTextTheme.of(context);
    return style.copyWith(
      titleTextStyle: switch (size) {
        MenoSize.md => textTheme.heading3Bold,
        MenoSize.lg => textTheme.heading2Medium,
        _ => textTheme.subheadingBold,
      },
      actionLabelTextStyle: switch (size) {
        MenoSize.md => textTheme.captionMedium,
        MenoSize.lg => textTheme.captionMedium,
        _ => textTheme.microMedium,
      },
    );
  }
}

class _SecondaryHeaderLarge extends MenoHeader {
  const _SecondaryHeaderLarge({required super.title, super.actions})
    : super._(headerHeight: 88);

  @override
  HeaderStyle themeStyleOf(BuildContext context) {
    final style = MenoHeaderTheme.of(context).secondary;
    final textTheme = MenoTextTheme.of(context);
    return style.copyWith(
      titleTextStyle: textTheme.heading2Medium,
      padding: const EdgeInsets.fromLTRB(40, 32, 40, 16),
    );
  }
}
