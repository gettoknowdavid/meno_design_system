import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// Describes how the [NavigationCell] is structured with regards to the
/// placement of the `icon` and `label`
enum NavigationCellAffinity {
  /// The `icon` is placed above the `label`
  column,

  /// The `icon` is placed on the left of the `label`
  row,
}

/// {@template navigation_cell}
/// Navigation bar cell item widget
/// {@endtemplate}
class NavigationCell extends StatelessWidget {
  /// {@macro navigation_cell}
  const NavigationCell({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    super.key,
    this.cellAffinity = NavigationCellAffinity.column,
  });

  /// Cell icon
  final Widget icon;

  /// Cell label
  final String label;

  /// Whether cell is selected or not
  final bool selected;

  /// Trigger to select cell
  final VoidCallback onTap;

  /// Placement of `icon` and `label`
  final NavigationCellAffinity cellAffinity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: switch (cellAffinity) {
        NavigationCellAffinity.column => Center(
          child: SizedBox(
            width: 63.75,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _Icon(key: key, selected: selected, icon: icon),
                const MenoSpacer.v(6),
                _Label(key: key, label: label, selected: selected),
              ],
            ),
          ),
        ),
        _ => Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Icon(key: key, selected: selected, icon: icon),
              const MenoSpacer.v(8),
              _Label(key: key, label: label, selected: selected),
            ],
          ),
        ),
      },
    );
  }
}

class _Label extends StatelessWidget {
  const _Label({required this.label, required this.selected, super.key});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final navigationBarTheme = MenoNavigationBarTheme.of(context);

    final selectedStyle = navigationBarTheme.labelTextStyle.selectedValue;
    final unselectedStyle = navigationBarTheme.labelTextStyle.noneValue;

    return Text(label, style: selected ? selectedStyle : unselectedStyle);
  }
}

class _Icon extends StatelessWidget {
  const _Icon({required this.icon, required this.selected, super.key});

  final Widget icon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final navigationBarTheme = MenoNavigationBarTheme.of(context);

    final selectedIconTheme = navigationBarTheme.iconTheme.selectedValue;
    final unselectedIconTheme = navigationBarTheme.iconTheme.noneValue;

    return SizedBox.square(
      dimension: 20,
      child: IconTheme(
        data: selected ? selectedIconTheme! : unselectedIconTheme!,
        child: icon,
      ),
    );
  }
}
