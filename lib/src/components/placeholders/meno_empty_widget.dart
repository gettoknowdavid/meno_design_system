import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// A placeholder for an empty widget
///
/// Typically used for loaded lists that have an empty result
///
class MenoEmptyWidget extends StatelessWidget {
  /// Builds the `MenoEmptyWidget`
  const MenoEmptyWidget({required this.description, this.action, super.key});

  /// Description of the placeholder
  final String description;

  /// An action.
  ///
  /// Can be a button to reload the list or do something else
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final colors = MenoColorScheme.of(context);
    return Center(
      child: Column(
        children: [
          const Spacer(),
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 104, maxHeight: 120),
            child: MenoAssets.images.liveForYou.image(),
          ),
          MenoText.caption(description, color: colors.labelDisabled),
          if (action != null) action!,
          const Spacer(),
        ],
      ),
    );
  }
}
