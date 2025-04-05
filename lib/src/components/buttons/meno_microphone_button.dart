import 'package:flutter/material.dart';
import 'package:meno_design_system/meno_design_system.dart';

/// {@template meno_microphone_button}
/// Meno Microphone Button
/// {@endtemplate}
class MenoMicrophoneButton extends StatelessWidget {
  /// {@macro meno_microphone_button}
  const MenoMicrophoneButton({required this.onPressed, super.key});

  /// What happens when the button is pressed
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = MenoColorScheme.of(context);
    const size = Size.square(56);
    return Center(
      child: IconButton.filled(
        onPressed: onPressed,
        icon: const SizedBox.square(
          dimension: 24,
          child: Icon(MIcons.microphone),
        ),
        style: ButtonStyle(
          padding: Internal.all(const EdgeInsets.all(16)),
          elevation: Internal.all(8),
          shadowColor: Internal.resolveWith(
            colors.brandPrimary.withValues(alpha: 0.25),
            pressed: colors.brandPrimary.withValues(alpha: 0.1),
          ),
          fixedSize: Internal.all(size),
          overlayColor: Internal.resolveWith(
            colors.buttonFill,
            pressed: colors.buttonFill.withValues(alpha: 0.4),
          ),
          backgroundColor: Internal.resolveWith(
            colors.buttonFill,
            pressed: colors.buttonFill.withValues(alpha: 0.8),
          ),
          iconColor: Internal.resolveWith(
            colors.buttonLabelPrimary,
            pressed: colors.buttonLabelPrimary.withValues(alpha: 0.8),
          ),
          foregroundColor: Internal.resolveWith(
            colors.buttonLabelPrimary,
            pressed: colors.buttonLabelPrimary.withValues(alpha: 0.8),
          ),
        ),
      ),
    );
  }
}
