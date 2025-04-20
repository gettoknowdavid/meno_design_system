
import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// A widget displaying an error or exception message
///
class MenoErrorWidget extends StatelessWidget {
  /// Builds the `MenoErrorWidget`
  const MenoErrorWidget(this.message, {this.action, super.key});

  /// The message of the error
  final String message;

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
          Icon(MIcons.help_circle, size: 24, color: colors.labelDisabled),
          const MenoSpacer.v(Insets.lg),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: MenoText.caption(
              message,
              color: colors.labelDisabled,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          const MenoSpacer.v(Insets.lg),
          SizedBox(
            height: 32,
            child: MenoOutlinedButton.icon(
              label: const Text('Reload'),
              icon: const Icon(Icons.refresh),
              onPressed: () {},
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
