import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_bottom_navigation_bar}
/// Bottom Navigation Bar
/// {@endtemplate}
class MenoBottomNavigationBar extends StatelessWidget {
  /// {@macro meno_bottom_navigation_bar}
  const MenoBottomNavigationBar({
    required this.destinations,
    required this.selectedIndex,
    super.key,
    this.onTap,
  });

  /// List of destinations
  final List<Widget> destinations;

  /// Index of the currently selected destination
  final int selectedIndex;

  /// Trigger to change the destination
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = MenoNavigationBarTheme.of(context);

    return Container(
      padding: theme.contentPadding,
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        border: Border(top: BorderSide(width: 0.8, color: theme.borderColor)),
      ),
      child: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onTap,
        destinations: destinations,
        backgroundColor: Colors.transparent,
        labelTextStyle: theme.labelTextStyle,
        indicatorColor: theme.selectedColor,
        elevation: 0,
      ),
    );
  }
}
