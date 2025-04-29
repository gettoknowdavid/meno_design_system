import 'package:flutter/material.dart';
import 'package:meno_design_system/src/components/tabs/tabs.dart';

/// {@template meno_tab_bar}
/// A concrete implementation of [BaseTabBar] providing factory constructors
/// for different tab bar styles.
/// {@endtemplate}
class MenoTabBar extends BaseTabBar {
  /// Creates a new [MenoTabBar].
  const MenoTabBar._({
    required super.tabs,
    required super.controller,
    super.isScrollable = true,
    super.key,
    super.type = MenoTabType.contained,
    super.padding,
    super.onTap,
  });

  /// Creates a [MenoTabBar] with the normal tab style.
  ///
  /// The normal style typically features an underline indicator for
  /// the selected tab.
  const factory MenoTabBar.normal({
    required List<MenoTab> tabs,
    required TabController controller,
    Key? key,
    bool isScrollable,
    void Function(int)? onTap,
    EdgeInsetsGeometry? padding,
  }) = _NormalMenoTabBar;

  /// Creates a [MenoTabBar] with the contained tab style.
  ///
  /// The contained style displays each tab as a separate, visually
  /// contained element.
  const factory MenoTabBar.contained({
    required List<MenoTab> tabs,
    required TabController controller,
    Key? key,
    bool isScrollable,
    void Function(int)? onTap,
    EdgeInsetsGeometry? padding,
  }) = _ContainedMenoTabBar;
}

/// Implementation for the normal style [MenoTabBar].
class _NormalMenoTabBar extends MenoTabBar {
  /// Creates a new [_NormalMenoTabBar].
  const _NormalMenoTabBar({
    required super.tabs,
    required super.controller,
    super.key,
    super.isScrollable = true,
    super.onTap,
    super.padding,
  }) : super._(type: MenoTabType.normal);
}

/// Implementation for the contained style [MenoTabBar].
class _ContainedMenoTabBar extends MenoTabBar {
  /// Creates a new [_ContainedMenoTabBar].
  const _ContainedMenoTabBar({
    required super.tabs,
    required super.controller,
    super.key,
    super.isScrollable = true,
    super.onTap,
    super.padding,
  }) : super._(type: MenoTabType.contained);
}
